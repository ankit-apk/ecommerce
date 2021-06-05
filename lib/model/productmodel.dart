// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productsFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productsToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    this.img,
    this.name,
    this.price,
  });

  String? img;
  String? name;
  String? price;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        img: json["img"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "name": name,
        "price": price,
      };
}
