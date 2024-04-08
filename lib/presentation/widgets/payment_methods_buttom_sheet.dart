import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  );
                  BlocProvider.of<PaymentCubit>(context).makePayment(
                    paymentIntentInputModel: paymentIntentInputModel,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
