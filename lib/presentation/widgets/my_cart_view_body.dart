import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/data/repos/checkout_repo_impl.dart';
import 'package:payment/presentation/manger/payment_cubit.dart';
import 'package:payment/presentation/widgets/payment_methods_buttom_sheet.dart';
import 'package:payment/presentation/widgets/total_price.dart';

import 'custom_button.dart';
import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 18.0,
                bottom: 25.0,
              ),
              child: Image.asset('assets/images/basket.png'),
            ),
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'$42.97',
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 3.0,
            ),
            child: OrderInfoItem(
              title: 'Discount',
              value: r'$0',
            ),
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'$8',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(
            title: 'Total',
            value: r'$50.97',
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
              bottom: 12.0,
            ),
            child: CustomButton(
              text: 'Complete Payment',
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const PaymentDetailsView(),
                //   ),
                // );
                showModalBottomSheet(
                  context: context,
                  builder: (context) => BlocProvider(
                    create: (context) => PaymentCubit(
                      CheckoutRepoImpl(),
                    ),
                    child: const PaymentMethodsBottomSheet(),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
