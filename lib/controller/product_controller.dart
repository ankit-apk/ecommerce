import 'package:ecommerce/model/productmodel.dart';
import 'package:ecommerce/networking/networking.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List productList = List<ProductModel>.empty(growable: true).obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    FetchProducts();
    print(productList);
    super.onInit();
  }

  void FetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService().getProduts();
      if (products != null) {
        productList.assignAll(products);
        print(productList);
      }
    } finally {
      isLoading(false);
    }
  }
}
