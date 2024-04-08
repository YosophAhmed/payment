import 'package:dartz/dartz.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';

import '../../core/errors.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}