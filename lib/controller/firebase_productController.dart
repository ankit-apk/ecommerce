import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirebaseProdutController extends GetxController {
  var productList = List.empty(growable: true).obs;
  var status = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  getProducts() async {
    try {
      CollectionReference c = FirebaseFirestore.instance.collection('links');
      c.snapshots().listen((products) {
        productList.value = products.docs;
      });
    } finally {
      status(false);
    }
  }
}
