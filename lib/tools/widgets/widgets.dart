import 'package:flutter/material.dart';

/*
MIT License
Copyright (c) 2021 Bunyawat Naunnak
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
* */

class AppWidget {
  /// Background image by path [imagePath]
  static Widget backgroundWidget({required String imagePath}) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)),
    );
  }

  /// Image widget by path [imagePath] and scale [scale]
  static Widget imageWidget({required String imagePath, double scale = 1.0}) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imagePath), scale: scale)),
    );
  }

  /// Image widget by path [imagePath] and scale [scale]
  static Widget imageButton({required String imagePath, Function()? onClick, double scale = 1.0}) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: IconButton(
        onPressed: onClick,
        icon: Image.asset(imagePath, scale: scale,),
        padding: const EdgeInsets.all(0.0),
      ),
    );
  }
}
