import 'package:dartz/dartz.dart';
import 'package:payment/core/errors.dart';
import 'package:payment/core/services/stripe_service.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';
import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return right(null);
    } catch (error) {
      return left(
        ServerFailure(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
