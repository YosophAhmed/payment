import 'package:flutter/material.dart';
import 'package:payment/presentation/views/thank_you_view.dart';
import 'package:payment/presentation/widgets/custom_button.dart';
import 'package:payment/presentation/widgets/custom_credit_card.dart';
import 'package:payment/presentation/widgets/payment_methods_list_view.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: PaymentMethodsListView(),
          ),
          SliverToBoxAdapter(
            child: CustomCreditCard(
              formKey: formKey,
              autovalidateMode: autovalidateMode,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 12.0,
                ),
                child: CustomButton(
                  text: 'Pay',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      debugPrint('payment');
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ThankYouView(),
                        ),
                      );
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
