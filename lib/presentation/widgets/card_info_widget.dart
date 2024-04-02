import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      height: 73,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/logo.svg'),
          const SizedBox(
            width: 23,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Credit Card',
                style: Styles.style18,
              ),
              Text(
                'Mastercard **78',
                style: Styles.style18.copyWith(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
