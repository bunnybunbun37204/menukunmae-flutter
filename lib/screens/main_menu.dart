import 'package:flutter/material.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';
import 'dart:developer' as dev;

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Widget showBackground() {
    return AppWidget.backgroundWidget(imagePath: "assets/images/bg_2.png");
  }

  Widget showBtnTest() {
    return AppWidget.imageButton(
        imagePath: "assets/images/btn_test.png", onClick: _testBtn, scale: 2.5);
  }

  void _testBtn() {
    dev.log("Click", name: "btn-test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Stack(
        children: <Widget>[showBackground(), showBtnTest()],
      ))),
    );
  }
}
