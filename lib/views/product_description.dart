import 'dart:convert';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/controller/cart_controller.dart';
import 'package:ecommerce/controller/favourite_controller.dart';
import 'package:ecommerce/utils/uicolors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductDescription extends StatefulWidget {
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  FavouritesController favController = Get.put(FavouritesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          favController.addFavourites(
            img: Get.arguments[0],
            prn: Get.arguments[1],
            prp: Get.arguments[2],
            prd: Get.arguments[3],
            prq: Get.arguments[4],
          );
          favController.launchWhatsapp(Get.arguments[1]);
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
                color: UiColors.buttonColors,
              ),
              child: Center(
                child: Text(
                  "Query",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // direction: Axis.horizontal,
          // spacing: MediaQuery.of(context).size.width / 2,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 8 / 10,
                  child: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      // child: CachedNetworkImage(
                      //   imageUrl: Get.arguments[0],
                      //   placeholder: (context, url) =>
                      //       Image.asset('assets/placeholder.png'),
                      //   fit: BoxFit.cover,
                      // ),
                      child: Image.memory(
                        base64Decode(Get.arguments[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 52.0, left: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 52.0, right: 16),
                //   child: Align(
                //     alignment: Alignment.topRight,
                //     child: CircleAvatar(
                //       backgroundColor: Colors.white,
                //       child: Icon(
                //         Icons.favorite,
                //         color: UiColors.buttonColors,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 10,
                  ),
                  child: Text(
                    Get.arguments[1],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.030,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, right: 16),
                  child: Text(
                    'Rs. ${Get.arguments[2]}',
                    style: TextStyle(
                        color: UiColors.buttonColors,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.035),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 100),
              child: Container(
                child: AutoSizeText(
                  '${Get.arguments[3]}',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.026,
                      fontWeight: FontWeight.w600),
                  maxLines: 3,
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 35.0),
            //     child: GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           // c.cartList = [Get.arguments].obs;
            //           c.cartList.add(Get.arguments);
            //         });
            //         HapticFeedback.vibrate();
            //       },
            //       child: Container(
            //         width: MediaQuery.of(context).size.width / 2,
            //         height: MediaQuery.of(context).size.height / 12,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.rectangle,
            //           borderRadius: BorderRadius.circular(30),
            //           color: UiColors.buttonColors,
            //         ),
            //         child: Center(
            //           child: Text(
            //             "Query",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.bold),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
