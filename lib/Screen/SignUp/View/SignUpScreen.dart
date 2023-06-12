import 'package:admin_ecommerce_firebase/Screen/SignUp/Controllor/SignUpControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpControllor signUpControllor = Get.put(
    SignUpControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 12.h),
                Center(
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                ),
                SizedBox(height: 30.sp),
                TextField(
                  controller: signUpControllor.txtEmail,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    prefixIconColor: Colors.black45,
                    labelStyle: TextStyle(
                      color: Colors.black45,
                    ),
                    label: Text("Email Address"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                  ),
                ),
                SizedBox(height: 15.sp),
                Obx(
                  () => TextField(
                    obscureText:
                        signUpControllor.isPass.value == true ? false : true,
                    controller: signUpControllor.txtPassword,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      prefixIconColor: Colors.black45,
                      labelStyle: TextStyle(
                        color: Colors.black45,
                      ),
                      label: Text("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          signUpControllor.isPass.value =
                              !signUpControllor.isPass.value;
                          // signUpControllor.isPass.value = true;
                        },
                        child: Icon(
                          signUpControllor.isPass == true
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.sp),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Show Password",
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Text(
                      "Forgot Password ? ",
                    ),
                  ],
                ),
                SizedBox(height: 15.sp),
                InkWell(
                  onTap: () async {
                    String? msg = await signUpControllor.signUp(
                      email: signUpControllor.txtEmail.text,
                      password: signUpControllor.txtPassword.text,
                    );
                    Get.snackbar("$msg", "");

                    if (msg == "success") {
                      Get.toNamed('/addUserDetail');
                    }
                  },
                  child: Container(
                    height: 35.sp,
                    width: 80.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(color: Colors.black87),
                      color: Colors.black54,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.sp),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Have Already Account ? SignIn",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 15.sp),
                InkWell(
                  // onTap: () async {
                  //   UserCredential user =
                  //       await FireHelper.fireHelper.signInWithGoogle();
                  //   // ignore: unnecessary_null_comparison
                  //   if (user == null) {
                  //     Get.snackbar("title", "message");
                  //   } else {
                  //     Get.offAndToNamed('/home');
                  //   }
                  // },
                  child: Image.asset(
                    "Assets/Images/Google1.png",
                    height: 40.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
