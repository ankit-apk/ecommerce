import 'package:ecommerce/model/productmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<ProductModel>> getProduts() async {
    var client = http.Client();

    var response = await client.get(
      Uri.parse(
          'https://drive.google.com/uc?export=view&id=1K_SyDgbjPjkJVidCCpXS333VNuFkgozT'),
    );
    if (response.statusCode == 200) {
      print("success");
      var jsonString = response.body;
      print(jsonString);
      return productsFromJson(jsonString);
    }
    throw response.statusCode;
  }
}
