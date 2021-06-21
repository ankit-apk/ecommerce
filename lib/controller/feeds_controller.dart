import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FeedsController extends GetxController {
  var feedList = List.empty(growable: true).obs;

  @override
  onInit() {
    super.onInit();
    getFeeds();
  }

  getFeeds() {
    CollectionReference c = FirebaseFirestore.instance.collection('feeds');
    c.snapshots().listen((feeds) {
      feedList.value = feeds.docs;
    });
  }
}
