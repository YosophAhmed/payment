import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/api_keys.dart';
import 'package:payment/presentation/views/my_cart_view.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyCartView(),
    );
  }
}
