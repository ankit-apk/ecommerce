import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/utils/uicolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  CartController c = Get.put(CartController());
  GetStorage cartBox = GetStorage();

  @override
  Widget build(BuildContext context) {
    List? products = cartBox.read('cart') == null
        ? List.empty(growable: true)
        : cartBox.read('cart');
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: products!.length,
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AspectRatio(
                      aspectRatio: 8 / 12,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // child: CachedNetworkImage(
                        //   imageUrl: c.cartList[index][0],
                        //   fit: BoxFit.cover,
                        //   placeholder: (context, url) =>
                        //       Image.asset('assets/placeholder.png'),
                        // ),
                        child: Image.memory(
                          base64Decode(products[index][0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(c.cartList[index][1]),
                    Text(c.cartList[index][2]),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                UiColors.buttonColors)),
                        onPressed: () {
                          c.cartList.removeAt(index);
                        },
                        child: Icon(Icons.delete))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
