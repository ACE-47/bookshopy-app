// import 'package:bookshopy_app/screens/cart/cart_screen.dart';
<<<<<<< HEAD
import 'package:bookshopy_app/provider/author.dart';
=======
import 'package:bookshopy_app/provider/auth.dart';
import 'package:bookshopy_app/provider/cart.dart';
import 'package:bookshopy_app/provider/orders.dart';
import 'package:bookshopy_app/screens/main_tab/main_tab_screen.dart';
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
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
<<<<<<< HEAD
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
=======
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products(''),
          update: (ctx, auth, previousOrders) => Products(auth.accessTocken),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders(''),
          update: (ctx, auth, previousOrders) => Orders(auth.accessTocken),
        ),
        ChangeNotifierProxyProvider<Auth, Cart>(
          create: (_) => Cart(''),
          update: (ctx, auth, previousCart) => Cart(auth.accessTocken),
        ),
        ChangeNotifierProvider(
          create: (_) => Authors(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BookShopy',
            theme: ThemeData(
              fontFamily: 'SF Pro Text',
              colorScheme: ColorScheme.fromSeed(
                seedColor: TColor.primary,
              ),
              // useMaterial3: true,
            ),
            // initialRoute: SignUpScreen.routeName,
            routes: routes,
            home: auth.isAuth
                ? const MainTabScreen()
                : FutureBuilder(
                    future: auth.tryAutoLogin(),
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (snapshot.data!) {
                          return const MainTabScreen();
                        } else {
                          return const OnBoardingScreen();
                        }
                      }
                    })),
      ),
>>>>>>> 985cf0f9320e88052335fd1ee9fce1a693c413f8
    )
  }
}
