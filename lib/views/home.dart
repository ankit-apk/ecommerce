import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce/controller/favourite_controller.dart';
import 'package:ecommerce/utils/uicolors.dart';
import 'package:ecommerce/views/accountInfo.dart';
import 'package:ecommerce/views/cart.dart';
import 'package:ecommerce/views/favouriteProducts.dart';
import 'package:ecommerce/views/products.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FavouritesController favController = Get.put(FavouritesController());
  int _bottomNavIndex = 0;
  List pages = [Products(), FavouriteProducts(), Cart(), AccountInfo()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: UiColors.buttonColors,
        child: Icon(FontAwesomeIcons.whatsapp),
        onPressed: () {
          favController.launchWhatsapp('Your Products');
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home_filled,
          Icons.favorite,
          Icons.feed,
          Icons.account_circle_sharp
        ],
        activeIndex: _bottomNavIndex,
        inactiveColor: UiColors.inacticeColor,
        activeColor: UiColors.buttonColors,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
      body: pages[_bottomNavIndex],
    );
  }
}
