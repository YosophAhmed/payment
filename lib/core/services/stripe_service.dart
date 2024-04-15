import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/api_keys.dart';
import 'package:payment/core/services/api_service.dart';
import 'package:payment/data/models/EphemralKeyModel.dart';
import 'package:payment/data/models/init_payment_sheet_input_model.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';
import 'package:payment/data/models/payment_intent_model.dart';

class StripeService {
  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future initPaymentSheet({
    required InitPaymentSheetModel paymentSheetModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentSheetModel.clientSecret,
        merchantDisplayName: 'Yosoph Ahmed',
        customerEphemeralKeySecret: paymentSheetModel.ephemeralKeySecret,
        customerId: paymentSheetModel.customerId,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    var ephemeralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );
    var paymentSheetModel = InitPaymentSheetModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
      paymentSheetModel: paymentSheetModel,
    );
    await displayPaymentSheet();
  }

  Future<PaymentIntentModel> createCustomer({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<EphemralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      body: {
        'customer': customerId,
      },
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2023-10-16',
      },
    );
    return EphemralKeyModel.fromJson(response.data);
  }
}
