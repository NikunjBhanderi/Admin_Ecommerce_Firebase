import 'package:admin_ecommerce_firebase/Screen/Home/Model/HomeModel.dart';
import 'package:admin_ecommerce_firebase/Utiles/FireBaseHelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeControllor extends GetxController {
  RxMap userDetail = {}.obs;
  List<HomeModel> DataList = [];
  RxBool isLike = false.obs;

  Stream<QuerySnapshot<Map<String, dynamic>>> readData() {
    return FirebaseHelper.firebaseHelper.readProduct();
  }
}
