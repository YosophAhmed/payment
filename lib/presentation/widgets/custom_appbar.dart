import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/styles.dart';

AppBar buildAppBar({
  required final String title,
}) =>
    AppBar(
      leading: Center(
        child: SvgPicture.asset('assets/images/arrow.svg'),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Styles.style25,
      ),
    );
