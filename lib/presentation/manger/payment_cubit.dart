
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';
import 'package:payment/data/repos/checkout_repo.dart';
import 'package:payment/presentation/manger/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(InitialPaymentState());

  final CheckoutRepo checkoutRepo;

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(LoadingPaymentState());
    var data = await checkoutRepo.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    data.fold(
      (l) => emit(
        FailurePaymentState(
          errorMessage: l.errorMessage,
        ),
      ),
      (r) => emit(SuccessPaymentState()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
