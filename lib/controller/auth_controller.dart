import 'package:ecommerce/views/home.dart';
import 'package:ecommerce/views/login.dart';
import 'package:ecommerce/views/products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  login(email, password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      GetStorage().write("status", _auth.currentUser!.uid);
      Get.offAll(Home());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', '${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white);
    }
  }

  signup(email, password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(LoginPage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', '${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white);
    }
  }

  logout() async {
    try {
      await _auth.signOut();
      GetStorage().remove("status");
      Get.offAll(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', '${e.message}',
          backgroundColor: Colors.blue, colorText: Colors.white);
    }
  }

  reset(email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (e) {
      Get.snackbar('Error', '${e.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue,
          colorText: Colors.white);
    }
  }

  emailProvider() {
    return _auth.currentUser!.email;
  }

  pageProvider() {
    var logstatus = GetStorage().read("status");
    try {
      logstatus = _auth.currentUser!.uid;
      return Home();
    } catch (e) {
      return LoginPage();
    }
  }
}
