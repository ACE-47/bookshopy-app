import 'package:bookshopy_app/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import '/screens/about_us/about_us_screen.dart';
import '/screens/author/author_screen.dart';
import '/screens/login/login_screen.dart';
import '/screens/main_tab/main_tab_screen.dart';
import '/screens/onboard/onboarding_screen.dart';
import '/screens/onboard/welcome_screen.dart';
import '/screens/product_details/product_detail_screen.dart';
import '/screens/search/search_force_screen.dart';
import '/screens/signup/complete_signup/complete_signup_screen.dart';
import '/screens/signup/sign_up_screen.dart';

final Map<String, WidgetBuilder> routes = {
  OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  LogInScreen.routeName: (context) => const LogInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteSignUpScreen.routeName: (context) => const CompleteSignUpScreen(),
  MainTabScreen.routeName: (context) => const MainTabScreen(),
  SearchForceScreen.routeName: (context) => const SearchForceScreen(),
  AboutUsScreen.routeName: (context) => AboutUsScreen(),
  AuthorScreen.routeName: (context) => const AuthorScreen(),
  ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};
