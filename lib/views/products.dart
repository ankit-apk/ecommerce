import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/firebase_productController.dart';
import 'package:ecommerce/utils/searchBox.dart';
import 'package:ecommerce/utils/uicolors.dart';
import 'package:ecommerce/views/product_description.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  // ProductController p = Get.put(ProductController());
  FirebaseProdutController products = Get.put(FirebaseProdutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              // direction: Axis.horizontal,
              children: [
                // Padding(
                //   padding:
                //       const EdgeInsets.only(top: 20.0, left: 30, right: 30),
                //   child: buildContainer(),
                // ),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 20),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          placeholder: (context, url) =>
                              Image.asset('assets/placeholder.png'),
                          imageUrl:
                              'https://images.pexels.com/photos/1854652/pexels-photo-1854652.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Trending",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.030,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                products.status.value
                    ? Container(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: UiColors.buttonColors,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GridView.builder(
                          itemCount: products.productList.length,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 7 / 10.4,
                                  mainAxisSpacing: 30,
                                  crossAxisSpacing: 5,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(
                                  ProductDescription(),
                                  arguments: [
                                    products.productList[index]['imageLink'],
                                    products.productList[index]['product_name'],
                                    products.productList[index]
                                        ['product_price'],
                                    products.productList[index]
                                        ['product_description'],
                                    products.productList[index]
                                        ['product_quantity'],
                                  ],
                                );
                              },
                              child: Container(
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  // child: Image.network(
                                  //   p.productList[index].img,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: AspectRatio(
                                          aspectRatio: 8 / 12,
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            // child: CachedNetworkImage(
                                            //   imageUrl:
                                            //       p.productList[index].img,
                                            //   fit: BoxFit.cover,
                                            //   placeholder: (context, url) =>
                                            //       Image.asset(
                                            //           'assets/placeholder.png'),
                                            // ),
                                            child: Image.memory(
                                              base64Decode(
                                                  products.productList[index]
                                                      ['imageLink']),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              28,
                                          decoration: BoxDecoration(
                                              color: Colors.black26),
                                          child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                products.productList[index]
                                                    ['product_name'],
                                                style: TextStyle(
                                                    color:
                                                        UiColors.searchBoxColor,
                                                    fontSize: 20),
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
