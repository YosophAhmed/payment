abstract class PaymentState {}

class InitialPaymentState extends PaymentState {}

class LoadingPaymentState extends PaymentState {}

class SuccessPaymentState extends PaymentState {}

class FailurePaymentState extends PaymentState {
  FailurePaymentState({
    required this.errorMessage,
  });

  final String errorMessage;
}
