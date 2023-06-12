import 'dart:async';
import 'package:admin_ecommerce_firebase/Utiles/FireBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplesScreen extends StatefulWidget {
  const SplesScreen({Key? key}) : super(key: key);

  @override
  State<SplesScreen> createState() => _SplesScreenState();
}

class _SplesScreenState extends State<SplesScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () {
        FirebaseHelper.firebaseHelper.checkLogin() == true
            ? Get.offAndToNamed('/bottom')
            : Get.offAndToNamed('/signIn');
      },
    );
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
