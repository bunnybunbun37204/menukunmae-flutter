import 'package:flutter/material.dart';

class AppWidget {
  /// Background image by path [imagePath]
  ///
  /// author `Bunyawat Naunnak`
  static Widget backgroundWidget({required String imagePath}) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
    );
  }

  /// Image widget by path [imagePath] and scale [scale]
  ///
  /// author `Bunyawat Naunnak`
  static Widget imageWidget({required String imagePath, double scale = 1.0}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imagePath), scale: scale)),
    );
  }

  /// Image widget by path [imagePath] and scale [scale]
  ///
  /// author `Bunyawat Naunnak`
  static Widget imageButton({required String imagePath, Function()? onClick, double scale = 1.0}) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: IconButton(
        onPressed: onClick,
        icon: Image.asset(imagePath),
        padding: const EdgeInsets.all(0.0),
      ),
    );
  }
}
