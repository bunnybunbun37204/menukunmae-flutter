import 'package:flutter/material.dart';
import 'package:menukunmae/tools/configs/config.dart';
import 'package:menukunmae/tools/widgets/alertdialog.dart';
import 'package:menukunmae/tools/widgets/autocompletetext.dart';
import 'package:menukunmae/tools/widgets/button.dart';

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

  /// Button widget
  static Widget buttonApplication(
      {String buttonMessage = "Press Me",
      required Function() onClick,
      Color color = Colors.blueAccent}) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      shadowColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );

    return ElevatedButton(
        child: Text(
          buttonMessage,
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: "Fridaymeduim"),
        ),
        onPressed: onClick,
        style: style);
  }

  /// Autocomplete text field
  ///
  /// `hintText` for create hint
  static Widget autoCompleteTextField(
      {String hintText = 'Search Ingredients',
      double vertical = 20.0,
      double horizontol = 20.0,
      IconData icon = Icons.search}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontol),
      child: AutocompleteTextField(
        hintText: hintText,
        icon: icon,
      ),
    );
  }

  static Widget listViewWidget(
      {required List<String> datas,
      required BuildContext context,
      void Function()? onTapDelete}) {
    return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, int index) {
              return ListTile(
                onTap: (() => {
                      Config.value = datas[index],
                      makeToast(message: datas[index], context: context)
                    }),
                title: Text(datas[index]),
                trailing: Wrap(
                  children: <Widget>[
                    IconButton(
                        onPressed: onTapDelete, icon: const Icon(Icons.delete))
                  ],
                ),
              );
            },
            separatorBuilder: (context, int index) {
              return const Divider();
            },
            itemCount: datas.length));
  }

  static Widget showPopup(
      {required String title,
      required String content,
      required BuildContext context,
      required WidgetBuilder builder}) {
    return MyAlertDialog.show(context: context, builder: builder);
  }

  static Widget buttonGradient({
    required Widget widget,
    required Gradient gradient,
    required void Function() onPressed,
  }) {
    return RaisedGradientButton(
        child: widget, gradient: gradient, onPressed: onPressed);
  }

  /// To make toast
  static void makeToast(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 700),
    ));
  }
}
