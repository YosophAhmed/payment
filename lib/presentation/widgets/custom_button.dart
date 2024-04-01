import 'package:flutter/material.dart';

import '../../core/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 73,
        decoration: ShapeDecoration(
          color: const Color(0xFF34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Styles.style22,
          ),
        ),
      ),
    );
  }
}
