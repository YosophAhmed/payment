import 'package:flutter/material.dart';
import 'package:payment/core/styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
      ],
    );
  }
}