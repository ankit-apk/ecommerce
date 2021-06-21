import 'dart:convert';

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FeedDetail extends StatefulWidget {
  const FeedDetail({Key? key}) : super(key: key);
  @override
  _FeedDetailState createState() => _FeedDetailState();
}

class _FeedDetailState extends State<FeedDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                          base64Decode(Get.arguments['imageLink']),
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

              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 10,
                  bottom: 10,
                ),
                child: Container(
                  child: Text(
                    Get.arguments['product_name'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.030,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  child: Text(
                    '${Get.arguments['product_description']}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.026,
                        fontWeight: FontWeight.w600),
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
      ),
    );
  }
}
