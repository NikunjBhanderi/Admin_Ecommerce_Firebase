import 'package:admin_ecommerce_firebase/Screen/Profile/Controlllor/ProfileControlllor.dart';
import 'package:admin_ecommerce_firebase/Screen/UpdateProfile/Modle/UpdateModel.dart';
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
          child: StreamBuilder(
            stream: profileControlllor.readData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                profileControlllor.dataList.clear();
                for (var x in snapshot.data!.docs) {
                  UpdateModel u1 = UpdateModel(
                    key: x.id,
                    name: x['name'],
                    surname: x['surname'],
                    mobile: x['mobile'],
                    email: x['email'],
                    types: x['types'],
                    job: x['job'],
                  );

                  profileControlllor.dataList.add(u1);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (profileControlllor.dataList.isEmpty) {
                              UpdateModel u1 = UpdateModel();
                              Get.toNamed(
                                'updateProfile',
                                arguments: u1,
                              );
                            } else {
                              UpdateModel u1 = UpdateModel(
                                key: profileControlllor.dataList[0].key,
                                name: profileControlllor.dataList[0].name,
                                surname: profileControlllor.dataList[0].surname,
                                mobile: profileControlllor.dataList[0].mobile,
                                job: profileControlllor.dataList[0].job,
                                types: profileControlllor.dataList[0].types,
                                email: profileControlllor.dataList[0].email,
                              );
                              Get.toNamed(
                                'updateProfile',
                                arguments: u1,
                              );
                            }
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
                              profileControlllor.dataList.isEmpty
                                  ? ""
                                  : "${profileControlllor.dataList[0].name} ${profileControlllor.dataList[0].surname}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 5.sp),
                            Text(
                              profileControlllor.dataList.isEmpty
                                  ? ""
                                  : "${profileControlllor.dataList[0].job}",
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
                              profileControlllor.dataList.isEmpty
                                  ? ""
                                  : "${profileControlllor.dataList[0].mobile}",
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
                              profileControlllor.dataList.isEmpty
                                  ? ""
                                  : "${profileControlllor.dataList[0].email}",
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
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
