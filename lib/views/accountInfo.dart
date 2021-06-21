import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/utils/uicolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountInfo extends StatefulWidget {
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                _authController.emailProvider(),
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.03),
                maxLines: 3,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: UiColors.buttonColors,
                    borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  onPressed: () {
                    _authController.logout();
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(UiColors.buttonColors)),
                  child: Text("Logout"),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     _authController.logout();
              //   },
              //   child: Text('Logout'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
