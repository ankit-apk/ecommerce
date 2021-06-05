import 'package:ecommerce/utils/uicolors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Container buildContainer() {
  return Container(
    decoration: BoxDecoration(color: UiColors.searchBoxColor),
    child: Row(
      children: [
        Icon(
          FontAwesomeIcons.search,
          color: UiColors.inacticeColor,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                hintText: "Find your product",
                disabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
          ),
        )
      ],
    ),
  );
}
