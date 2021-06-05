import 'dart:async';

import 'package:ecommerce/utils/uicolors.dart';
import 'package:ecommerce/views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animations/loading_animations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, home);
  }

  home() {
    Get.offAll(Home());
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Wrap(
          direction: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 46.0),
              child: Center(
                child: Text(
                  "ClothY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.040,
                    color: UiColors.buttonColors,
                  ),
                ),
              ),
            ),
            Image.asset('assets/splash.png'),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 30, bottom: 30),
              child: Center(
                child: Text(
                  "Cool Outfits for ColthY You",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.030,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            LoadingFilling.square(
              borderColor: UiColors.buttonColors,
              fillingColor: UiColors.buttonColors,
            )
          ],
        ),
      ),
    );
  }
}
