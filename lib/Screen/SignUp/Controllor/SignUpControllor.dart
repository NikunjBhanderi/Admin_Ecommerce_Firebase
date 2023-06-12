import 'package:admin_ecommerce_firebase/Utiles/FireBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpControllor extends GetxController {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  RxBool isPass = false.obs;



  Future<String?> signUp({required email, required password}) async {
    return await FirebaseHelper.firebaseHelper.signUp(
      email: email,
      password: password,
    );
  }
}
