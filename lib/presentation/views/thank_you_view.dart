import 'package:flutter/material.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: '',
      ),
      body: const ThankYouViewBody(),
    );
  }
}
