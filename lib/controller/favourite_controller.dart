import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class FavouritesController extends GetxController {
  var favouritesList = List.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    getFavourites();
  }

  addFavourites({required String img, prd, prn, prp, prq}) async {
    Map<String, dynamic> favourites = {
      'imageLink': img,
      'product_description': prd,
      'product_name': prn,
      'product_price': prp,
      'product_quantity': prq,
    };

    CollectionReference c = FirebaseFirestore.instance.collection('favourites');
    c
        .doc(GetStorage().read("status"))
        .collection('user')
        .doc('$prn')
        .set(favourites);
  }

  removeProduct(String prn) async {
    CollectionReference c = FirebaseFirestore.instance.collection('favourites');
    c.doc(GetStorage().read("status")).collection('user').doc('$prn').delete();
  }

  getFavourites() async {
    CollectionReference c = FirebaseFirestore.instance.collection('favourites');
    c.doc(GetStorage().read("status")).collection('user').snapshots().listen(
      (favourites) {
        favouritesList.value = favourites.docs;
      },
    );
  }

  launchWhatsapp(String prn) async {
    final link = WhatsAppUnilink(
      phoneNumber: '+91-7004297500',
      text: "Hey! I'm inquiring about the $prn",
    );
    await launch('$link');
  }
}
