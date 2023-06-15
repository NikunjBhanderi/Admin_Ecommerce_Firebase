import 'package:admin_ecommerce_firebase/Screen/UpdateProfile/Controllor/UpdateProfileControllor.dart';
import 'package:admin_ecommerce_firebase/Screen/UpdateProfile/Modle/UpdateModel.dart';
import 'package:admin_ecommerce_firebase/Utiles/FireBaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  UpdateProfileControllor updateProfileControllor = Get.put(
    UpdateProfileControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50.sp,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.sp),
                    bottomRight: Radius.circular(20.sp),
                  ),
                  color: Colors.pink,
                ),
                child: Text(
                  "-  -  -  Update Profile  -  -  -",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Column(
                  children: [
                    TextField(
                      controller: updateProfileControllor.txtName,
                      decoration: InputDecoration(
                        label: Text("Enter Your Name"),
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: "",
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: updateProfileControllor.txtSurname,
                      decoration: InputDecoration(
                        label: Text("Enter Your Surname"),
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: "",
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: updateProfileControllor.txtJob,
                      decoration: InputDecoration(
                        label: Text("Enter Your Job"),
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: "",
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: updateProfileControllor.txtMobileNo,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        label: Text("Enter Your Mobile No."),
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: "",
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    TextField(
                      controller: updateProfileControllor.txtEmailId,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        label: Text("Enter Your Email Id."),
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        hintText: "",
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.sp),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                    Obx(
                      () => DropdownButton(
                        value: updateProfileControllor.adminUser.value,
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Admin",
                            ),
                            value: "admin",
                          ),
                          DropdownMenuItem(
                            child: Text(
                              "User",
                            ),
                            value: "user",
                          ),
                        ],
                        onChanged: (value) {
                          updateProfileControllor.adminUser.value = value!;
                        },
                      ),
                    ),
                    SizedBox(height: 20.sp),
                    InkWell(
                      onTap: () async {
                        UpdateModel u1 = UpdateModel(
                          surname: updateProfileControllor.txtSurname.text,
                          mobile: updateProfileControllor.txtMobileNo.text,
                          job: updateProfileControllor.txtJob.text,
                          email: updateProfileControllor.txtEmailId.text,
                          types: updateProfileControllor.adminUser.value,
                          name: updateProfileControllor.txtName.text,
                        );

                        print(u1);
                        String msg = await FirebaseHelper.firebaseHelper
                            .insertProfileData(
                          types: u1.types,
                          email: u1.email,
                          job: u1.job,
                          mobile: u1.mobile,
                          surname: u1.surname,
                          name: u1.name,
                        );

                        print(msg);

                        if (msg == "success") {
                          Get.snackbar(
                            "$msg",
                            "",
                          );
                          Get.back();
                        } else {
                          Get.snackbar(
                            "$msg",
                            "",
                          );
                        }
                      },
                      child: Container(
                        height: 30.sp,
                        width: 60.sp,
                        decoration: BoxDecoration(
                            color: Colors.pink.shade300,
                            borderRadius: BorderRadius.circular(10.sp),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.pink, offset: Offset(0, 5)),
                            ]),
                        alignment: Alignment.center,
                        child: Text(
                          "Update",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
