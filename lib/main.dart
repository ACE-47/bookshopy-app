// import 'package:bookshopy_app/screens/cart/cart_screen.dart';
import 'package:bookshopy_app/provider/author.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/provider/products.dart';
import '/routes.dart';

import 'screens/onboard/onboarding_screen.dart';

import 'common/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Authors(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BookShopy',
          theme: ThemeData(
            fontFamily: 'SF Pro Text',
            colorScheme: ColorScheme.fromSeed(
              seedColor: TColor.primary,
            ),
            // useMaterial3: true,
          ),
          // initialRoute: CartScreen.routeName,
          routes: routes,
          home: const OnBoardingScreen()),
    );
  }
}
