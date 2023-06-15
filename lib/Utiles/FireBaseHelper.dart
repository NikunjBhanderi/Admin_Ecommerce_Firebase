import 'package:admin_ecommerce_firebase/Screen/Home/Model/HomeModel.dart';
import 'package:admin_ecommerce_firebase/Screen/UpdateProfile/Modle/UpdateModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FirebaseHelper {
  static FirebaseHelper firebaseHelper = FirebaseHelper._();

  FirebaseHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  // login

  Future<String> signUp({
    required email,
    required password,
  }) async {
    return await firebaseAuth
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      return "success";
    }).catchError((e) {
      return "$e";
    });
  }

  Future<String> signIn({
    required email,
    required password,
  }) async {
    return await firebaseAuth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      return "success";
    }).catchError((e) {
      return "$e";
    });
  }

  bool checkLogin() {
    User? user = firebaseAuth.currentUser;

    var uid = user?.uid;
    if (uid != null) {
      return true;
    } else {
      return false;
    }
  }

  void signOut() {
    firebaseAuth.signOut();
    Get.offAndToNamed('signIn');
  }

  // Find Method
  String FindUid() {
    User? user = firebaseAuth.currentUser;
    var uid = user!.uid;
    return uid;
  }

  Future<String> findFcmKey() async {
    var fcmKey = await firebaseMessaging.getToken();
    return fcmKey!;
  }

  // database

  Future<String> insertProduct({
    required name,
    required price,
    required desc,
    required rate,
    required stoke,
    required brand,
    required image,
  }) async {
    return await firebaseFirestore.collection("product").add(
      {
        "name": name,
        "price": price,
        "desc": desc,
        "rate": rate,
        "stoke": stoke,
        "brand": brand,
        "image": image,
      },
    ).then((value) {
      return "success";
    }).catchError((e) {
      return "$e";
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readProduct() {
    return firebaseFirestore.collection("product").snapshots();
  }

  Future<String> insertProfileData({
    required name,
    required surname,
    required job,
    required email,
    required mobile,
    required types,
  }) async {
    return await firebaseFirestore
        .collection("cart")
        .doc(FindUid())
        .collection("detail")
        .add(
      {
        "name": name,
        "surname": surname,
        "job": job,
        "mobile": mobile,
        "email": email,
        "types": types,
        "fcmKey": findFcmKey(),
      },
    ).then((value) {
      return "success";
    }).catchError((e) {
      print(e);
      return "Failed";
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> readProfileData({
    required UpdateModel u1,
  }) {
    return firebaseFirestore
        .collection("cart")
        .doc(FindUid())
        .collection("detail")
        .doc(u1.key)
        .snapshots();
  }
}
