import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:payment/data/models/amount_model.dart';
import 'package:payment/data/models/item_list_model.dart';
import 'package:payment/data/models/payment_intent_input_model.dart';
import 'package:payment/presentation/manger/payment_cubit.dart';
import 'package:payment/presentation/manger/payment_state.dart';
import 'package:payment/presentation/views/thank_you_view.dart';
import 'package:payment/presentation/widgets/custom_button.dart';
import 'package:payment/presentation/widgets/payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 16.0,
              bottom: 32.0,
            ),
            child: PaymentMethodsListView(),
          ),
          BlocConsumer<PaymentCubit, PaymentState>(
            listener: (BuildContext context, PaymentState state) {
              if (state is SuccessPaymentState) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const ThankYouView(),
                  ),
                );
              }
              if (state is FailurePaymentState) {
                Navigator.pop(context);
                SnackBar snackBar = SnackBar(
                  content: Text(
                    state.errorMessage,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            builder: (BuildContext context, PaymentState state) {
              return CustomButton(
                isLoading: state is LoadingPaymentState ? true : false,
                text: 'Pay',
                onTap: () {
                  PaymentIntentInputModel paymentIntentInputModel =
                      PaymentIntentInputModel(
                    amount: '100',
                    currency: 'USD',
                    customerId: 'cus_PvBVwo5vOSQFo7',
                  );
                  BlocProvider.of<PaymentCubit>(context).makePayment(
                    paymentIntentInputModel: paymentIntentInputModel,
                  );
                  // var transactionsData = getTransactionData();

                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) => PaypalCheckoutView(
                  //       sandboxMode: true,
                  //       clientId: ApiKeys.clientId,
                  //       secretKey: ApiKeys.clientSecret,
                  //       transactions: [
                  //         {
                  //           "amount": transactionsData.amount.toJson(),
                  //           "description":
                  //               "The payment transaction description.",
                  //           "item_list": transactionsData.itemList.toJson(),
                  //         }
                  //       ],
                  //       note: "Contact us for any questions on your order.",
                  //       onSuccess: (Map params) async {
                  //         log("onSuccess: $params");
                  //         Navigator.pop(context);
                  //       },
                  //       onError: (error) {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           SnackBar(
                  //             content: Text(
                  //               error.toString(),
                  //             ),
                  //           ),
                  //         );
                  //         log("onError: $error");
                  //         Navigator.pop(context);
                  //       },
                  //       onCancel: () {
                  //         log('cancelled:');
                  //         Navigator.pop(context);
                  //       },
                  //     ),
                  //   ),
                  // );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  ({
    AmountModel amount,
    ItemListModel itemList,
  }) getTransactionData() {
    var amount = AmountModel(
      currency: 'USD',
      total: "100",
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100",
      ),
    );

    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '4',
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '5',
        quantity: 12,
      ),
    ];

    var itemList = ItemListModel(
      orders: orders,
    );

    return (amount: amount, itemList: itemList);
  }
}
