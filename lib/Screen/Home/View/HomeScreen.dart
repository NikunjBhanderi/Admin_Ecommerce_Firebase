import 'dart:typed_data';

import 'package:admin_ecommerce_firebase/Screen/Home/Controllor/HomeControllor.dart';
import 'package:admin_ecommerce_firebase/Screen/Home/Model/HomeModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeControllor homeControllor = Get.put(
    HomeControllor(),
  );

  @override
  void initState() {
    super.initState();

    // homeControllor.userDetail.value = FireHelper.fireHelper.UserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.red,
                      ),
                      Text(
                        "Location",
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/profile');
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.pink,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              Center(
                child: Container(
                  height: 35.sp,
                  width: 300.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffFFF0F0),
                        Color(0xffFFDFDF),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50.sp,
                          width: 50.sp,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.search,
                          ),
                        ),
                        Container(
                          height: 50.sp,
                          width: 100.sp,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Search...",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              Expanded(
                child: StreamBuilder(
                  stream: homeControllor.readData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "${snapshot.error}",
                        ),
                      );
                    } else if (snapshot.hasData) {
                      QuerySnapshot? snapData = snapshot.data;

                      homeControllor.DataList.clear();

                      for (var x in snapData!.docs) {
                        HomeModel homeModel = HomeModel(
                          stoke: x['stoke'],
                          rate: x['rate'],
                          price: x['price'],
                          desc: x['desc'],
                          brand: x['brand'],
                          name: x['name'],
                          image: x['image'],
                          key: x.id,
                          isButton: false,
                          isLike: false,
                          status: 0,
                        );

                        homeControllor.DataList.add(homeModel);
                      }
                      return Column(
                        children: [
                          Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 200.sp,
                              ),
                              itemCount: homeControllor.DataList.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    print(
                                        "${homeControllor.DataList[index].key}");
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.sp),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    margin: EdgeInsets.all(10),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "⭐️ ${homeControllor.DataList[index].rate}",
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    homeControllor
                                                            .isLike.value =
                                                        !homeControllor
                                                            .isLike.value;
                                                    homeControllor
                                                            .DataList[index]
                                                            .isLike =
                                                        homeControllor
                                                            .isLike.value;
                                                  });

                                                  print(homeControllor
                                                      .isLike.value);
                                                  print(
                                                      "${homeControllor.DataList[index].isLike}---------------${index}");
                                                },
                                                icon: Icon(
                                                  homeControllor.DataList[index]
                                                              .isLike ==
                                                          true
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: Colors.pink,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: Container(
                                              height: 80.sp,
                                              child: Image.memory(
                                                  Uint8List.fromList(
                                                      homeControllor
                                                          .DataList[index]
                                                          .image!
                                                          .codeUnits)),
                                            ),
                                          ),
                                          Container(
                                            height: 20.sp,
                                            child: Text(
                                              "${homeControllor.DataList[index].name}",
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 10.sp,
                                            child: Text(
                                              "${homeControllor.DataList[index].desc}",
                                              style: TextStyle(
                                                fontSize: 8.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.sp),
                                          Container(
                                            height: 30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$ ${homeControllor.DataList[index].price}.00",
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    HomeModel h1 = HomeModel(
                                                      key: homeControllor
                                                          .DataList[index].key,
                                                      name: homeControllor
                                                          .DataList[index].name,
                                                      image: homeControllor
                                                          .DataList[index]
                                                          .image,
                                                      desc: homeControllor
                                                          .DataList[index].desc,
                                                      price: homeControllor
                                                          .DataList[index]
                                                          .price,
                                                      rate: homeControllor
                                                          .DataList[index].rate,
                                                      brand: homeControllor
                                                          .DataList[index]
                                                          .brand,
                                                      stoke: homeControllor
                                                          .DataList[index]
                                                          .stoke,
                                                      status: 1,
                                                    );

                                                    Get.toNamed(
                                                      '/addData',
                                                      arguments: h1,
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 30.sp,
                                                    width: 30.sp,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.pink,
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                      size: 10.sp,
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
                              },
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
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            HomeModel h1 = HomeModel(
              status: 0,
            );
            Get.toNamed(
              '/addData',
              arguments: h1,
            );
          },
        ),
      ),
    );
  }
}
