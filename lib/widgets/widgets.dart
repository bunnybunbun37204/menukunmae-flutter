import 'package:flutter/material.dart';

class AppWidget {
  static Widget backgroundWidget(String imagePath) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imagePath), fit: BoxFit.cover)),
    );
  }
}