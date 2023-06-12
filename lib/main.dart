import 'package:admin_ecommerce_firebase/Screen/AddData/View/AddDataScreen.dart';
import 'package:admin_ecommerce_firebase/Screen/Home/View/HomeScreen.dart';
import 'package:admin_ecommerce_firebase/Screen/SignIn/View/SignInScreen.dart';
import 'package:admin_ecommerce_firebase/Screen/SignUp/View/SignUpScreen.dart';
import 'package:admin_ecommerce_firebase/Screen/Sples/View/SplesScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
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
          GetPage(
            name: '/addData',
            page: () => AddDataScreen(),
          ),
        ],
      ),
    ),
  );
}
