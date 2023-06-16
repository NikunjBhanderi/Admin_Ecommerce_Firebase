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

  UpdateModel u1 = Get.arguments;

  @override
  void initState() {
    super.initState();

    updateProfileControllor.txtName =
        TextEditingController(text: u1 == null ? "" : "${u1.name}");
    updateProfileControllor.txtSurname =
        TextEditingController(text: u1 == null ? "" : "${u1.surname}");
    updateProfileControllor.txtEmailId =
        TextEditingController(text: u1 == null ? "" : "${u1.email}");
    updateProfileControllor.txtJob =
        TextEditingController(text: u1 == null ? "" : "${u1.job}");
    updateProfileControllor.txtMobileNo =
        TextEditingController(text: u1 == null ? "" : "${u1.mobile}");
    updateProfileControllor.adminUser.value =
        u1 == null ? "admin" : "${u1.types}";
  }

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
                    // Obx(
                    //   () => DropdownButton(
                    //     value: updateProfileControllor.adminUser.value,
                    //     isExpanded: true,
                    //     items: [
                    //       DropdownMenuItem(
                    //         child: Text(
                    //           "Admin",
                    //         ),
                    //         value: "admin",
                    //       ),
                    //       DropdownMenuItem(
                    //         child: Text(
                    //           "User",
                    //         ),
                    //         value: "user",
                    //       ),
                    //     ],
                    //     onChanged: (value) {
                    //       updateProfileControllor.adminUser.value = value!;
                    //     },
                    //   ),
                    // ),
                    SizedBox(height: 20.sp),
                    InkWell(
                      onTap: () async {
                        if (u1 == null) {
                          UpdateModel userModel = UpdateModel(
                            surname: updateProfileControllor.txtSurname.text,
                            mobile: updateProfileControllor.txtMobileNo.text,
                            job: updateProfileControllor.txtJob.text,
                            email: updateProfileControllor.txtEmailId.text,
                            types: updateProfileControllor.adminUser.value,
                            name: updateProfileControllor.txtName.text,
                          );

                          String msg =
                              await updateProfileControllor.insertProfile(
                            u1: userModel,
                          );

                          if (msg == "success") {
                            Get.back();
                          }
                          Get.snackbar(
                            "$msg",
                            "",
                          );
                        } else {
                          print(u1.key);
                          UpdateModel userModel = UpdateModel(
                            surname: updateProfileControllor.txtSurname.text,
                            mobile: updateProfileControllor.txtMobileNo.text,
                            job: updateProfileControllor.txtJob.text,
                            email: updateProfileControllor.txtEmailId.text,
                            types: updateProfileControllor.adminUser.value,
                            name: updateProfileControllor.txtName.text,
                            key: u1.key,
                          );

                          String msg =
                              await updateProfileControllor.updateProfile(
                            u1: userModel,
                          );

                          if (msg == "success") {
                            Get.back();
                          }
                          Get.snackbar(
                            "$msg",
                            "",
                          );
                        }

                        // String msg =
                        //     await updateProfileControllor.insertProfile(
                        //   u1: u1,
                        // );
                        //
                        // print("=============================$msg");
                        //
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
