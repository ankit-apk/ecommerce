import 'dart:convert';
import 'package:ecommerce/controller/feeds_controller.dart';
import 'package:ecommerce/views/feed_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  FeedsController feedCont = Get.put(FeedsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: ListView.builder(
            itemCount: feedCont.feedList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(FeedDetail(), arguments: feedCont.feedList[index]);
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.memory(
                            base64Decode(
                              feedCont.feedList[index]['imageLink'],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            feedCont.feedList[index]['product_name'],
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.022),
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
      ),
    );
  }
}
