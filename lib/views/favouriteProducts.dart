import 'dart:convert';

import 'package:ecommerce/controller/favourite_controller.dart';
import 'package:ecommerce/utils/uicolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import 'fav_product_description.dart';

class FavouriteProducts extends StatefulWidget {
  @override
  _FavouriteProductsState createState() => _FavouriteProductsState();
}

class _FavouriteProductsState extends State<FavouriteProducts> {
  FavouritesController favouritesController = Get.put(FavouritesController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => favouritesController.favouritesList.isEmpty
          ? Scaffold(
              backgroundColor: Color(0xfffbecec),
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Queried Products will appear here',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.024),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // color: Colors.red,
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: RiveAnimation.asset('assets/heart.riv'),
                      )
                    ],
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: favouritesController.favouritesList.length,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 7 / 10.4,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 5,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                        FavouriteProductDescription(),
                        arguments: [
                          favouritesController.favouritesList[index]
                              ['imageLink'],
                          favouritesController.favouritesList[index]
                              ['product_name'],
                          favouritesController.favouritesList[index]
                              ['product_price'],
                          favouritesController.favouritesList[index]
                              ['product_description'],
                          favouritesController.favouritesList[index]
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
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.memory(
                                    base64Decode(favouritesController
                                        .favouritesList[index]['imageLink']),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 28,
                                decoration:
                                    BoxDecoration(color: Colors.black26),
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      favouritesController.favouritesList[index]
                                          ['product_name'],
                                      style: TextStyle(
                                          color: UiColors.searchBoxColor,
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
    );
  }
}
