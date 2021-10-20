import 'package:flutter/material.dart';
import 'package:menukunmae/tools/utils/utils.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';
import 'dart:developer' as dev;

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late BuildContext _context;
  Widget showBackground() {
    return AppWidget.backgroundWidget(imagePath: "assets/images/bg_2.png");
  }

  Widget showBtnTest1() {
    return AppWidget.imageButton(
        imagePath: "assets/images/btn_test.png", onClick: testBtn, size: 300.0);
  }

  Widget showBtnTest2() {
    return AppWidget.imageButton(
        imagePath: "assets/images/btn_test.png", onClick: testBtn, size: 300.0);
  }

  Widget showBtnComponent() {
    dev.log("showBtnComponent", name: "Widfet test");
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AppWidget.buttonTest(onClick: testBtn),
          AppWidget.buttonTest(onClick: testBtn),
          AppWidget.buttonTest(onClick: testBtn),
        ],
      ),
    );
  }

  void testBtn() {
    Utils.moveToPreviousScreen(_context);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[showBackground(), showBtnComponent()],
      )),
    );
  }
}
