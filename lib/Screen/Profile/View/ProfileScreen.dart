import 'package:admin_ecommerce_firebase/Screen/Profile/Controlllor/ProfileControlllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileControlllor profileControlllor = Get.put(
    ProfileControlllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.toNamed('/updateProfile');
                    },
                    icon: Icon(
                      Icons.edit,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 40.sp,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nikunj bhanderi",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.sp),
                      Text(
                        "Ecommerce",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.call_outlined,
                        color: Colors.black38,
                      ),
                      SizedBox(width: 20.sp),
                      Text(
                        "+91 6352431889",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.sp),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: Colors.black38,
                      ),
                      SizedBox(width: 20.sp),
                      Text(
                        "nikunjbhanderi135@gmail.com",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    alignment: Alignment.center,
                    width: 20.h,
                    height: 50.sp,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "\$100.00",
                        ),
                        Text(
                          "Wallet",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    alignment: Alignment.center,
                    width: 20.h,
                    height: 50.sp,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "2",
                        ),
                        Text(
                          "Orders",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.pink,
                  ),
                  SizedBox(width: 15.sp),
                  Text(
                    "Your Favorite",
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              InkWell(
                onTap: () {
                  profileControlllor.signOut();
                  Get.offAndToNamed('/signIn');
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.power_settings_new_outlined,
                      color: Colors.red,
                    ),
                    SizedBox(width: 15.sp),
                    Text(
                      "Log Out",
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
