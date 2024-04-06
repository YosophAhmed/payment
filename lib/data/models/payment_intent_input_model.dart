class PaymentIntentInputModel {
  PaymentIntentInputModel({
    required this.amount,
    required this.currency,
  });

  final String amount;
  final String currency;

  toJson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}