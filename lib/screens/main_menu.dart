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

  Widget showBtnTest1() {
    return AppWidget.imageButton(
        imagePath: "assets/images/btn_test.png", onClick: _testBtn, scale: 2.5);
  }

  Widget showBtnTest2() {
    return AppWidget.imageButton(
        imagePath: "assets/images/btn_test.png", onClick: _testBtn, scale: 2.5);
  }

  Widget showBtnComponent() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(children: <Widget>[Text("Hi"), Text("Hello, Test")]));
  }

  void _testBtn() {
    dev.log("Click", name: "btn-test");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[showBackground(), showBtnComponent()],
      )),
    );
  }
}
