import 'dart:async';
import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/utils/uicolors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rive/rive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.upToDown,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.put(AuthController());
  startTime() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, home);
  }

  home() {
    Get.offAll(authController.pageProvider());
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.splashColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 46.0),
                child: Center(
                  child: Text(
                    "FoodY",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.040,
                      color: UiColors.textColor,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 30, bottom: 00),
                child: Center(
                  child: Text(
                    "Foods that eat hunger!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.030,
                      color: UiColors.textColor,
                    ),
                  ),
                ),
              ),
              Container(
                child: RiveAnimation.asset(
                  'assets/hand.riv',
                  // fit: BoxFit.fill,
                ),
                height: MediaQuery.of(context).size.height / 0.8,
                width: MediaQuery.of(context).size.width,
              ),
              // Image.asset('assets/splash.png'),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 16.0, right: 16.0, top: 30, bottom: 30),
              //   child: Center(
              //     child: Text(
              //       "Foods that eat hunger!",
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: MediaQuery.of(context).size.height * 0.030,
              //         color: UiColors.textColor,
              //       ),
              //     ),
              //   ),
              // ),
              // LoadingFilling.square(
              //   borderColor: UiColors.buttonColors,
              //   fillingColor: UiColors.buttonColors,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
