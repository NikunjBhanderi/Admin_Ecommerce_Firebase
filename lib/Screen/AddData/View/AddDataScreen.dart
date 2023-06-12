import 'dart:html';
import 'dart:math';
import 'dart:typed_data';

import 'package:admin_ecommerce_firebase/Screen/AddData/Controllor/AddDataControllor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_to_byte/image_to_byte.dart';
import 'package:sizer/sizer.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  AddDataControllor addDataControllor = Get.put(
    AddDataControllor(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 50.sp,
                ),
                SizedBox(height: 10.sp),
                ElevatedButton(
                  onPressed: () async {
                    ImagePicker imagePiker = ImagePicker();
                    XFile? xfile =
                          await imagePiker.pickImage(source: ImageSource.gallery);

                    String image = xfile!.path;

                    // Uint8List imagebytes = await imagefile.readAsBytes();

                    print("---------------------------${xfile.path}");
                  },
                  child: Text(
                    "Image",
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtName,
                  decoration: InputDecoration(
                    label: Text("Enter Product Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtPrice,
                  decoration: InputDecoration(
                    label: Text("Enter Product Price"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtBrande,
                  decoration: InputDecoration(
                    label: Text("Enter Product Brand"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtRate,
                  decoration: InputDecoration(
                    label: Text("Enter Product Rate"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtStoke,
                  decoration: InputDecoration(
                    label: Text("Enter Product Stoke"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                TextField(
                  controller: addDataControllor.txtDesc,
                  maxLines: 3,
                  decoration: InputDecoration(
                    label: Text("Enter Product Description"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.sp),
                InkWell(
                  onTap: () async {
                    String msg = await addDataControllor.insertProduct(
                      name: addDataControllor.txtName.text,
                      price: int.parse("${addDataControllor.txtPrice.text}"),
                      desc: addDataControllor.txtDesc.text,
                      rate: double.parse("${addDataControllor.txtRate.text}"),
                      stoke: int.parse("${addDataControllor.txtStoke.text}"),
                      brand: addDataControllor.txtBrande.text,
                      image: "",
                    );

                    Get.snackbar("$msg", "");
                  },
                  child: Container(
                    width: 60.sp,
                    height: 30.sp,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          color: Colors.pink.shade900,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.pink,
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
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
