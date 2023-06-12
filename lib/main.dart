import 'package:admin_ecommerce_firebase/Screen/Home/View/HomeScreen.dart';
import 'package:admin_ecommerce_firebase/Screen/SignIn/View/SignInScreen.dart';
import 'package:admin_ecommerce_firebase/Screen/SignUp/View/SignUpScreen.dart';
import 'package:admin_ecommerce_firebase/Screen/Sples/View/SplesScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        getPages: [
          GetPage(
            name: '/',
            page: () => SplesScreen(),
          ),
          GetPage(
            name: '/signIn',
            page: () => SignInScreen(),
          ),
          GetPage(
            name: '/signUp',
            page: () => SignUpScreen(),
          ),
          GetPage(
            name: '/home',
            page: () => HomeScreen(),
          ),
        ],
      ),
    ),
  );
}
