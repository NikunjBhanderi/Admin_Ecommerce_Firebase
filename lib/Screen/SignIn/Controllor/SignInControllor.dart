
import 'package:admin_ecommerce_firebase/Utiles/FireBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInControllor extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  RxBool isPass = false.obs;

  Future<String> signIn({
    required email,
    required password,
  }) {
    return FirebaseHelper.firebaseHelper.signIn(
      email: email,
      password: password,
    );
  }
}
