import 'package:flutter/material.dart';
import 'package:menukunmae/screens/user_storage.dart';
import 'package:menukunmae/tools/utils/utils.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';
import 'dart:developer' as dev;

//หน้าเมนู

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Widget showBackground() {
    return AppWidget.backgroundWidget(imagePath: "assets/images/bg_2.png");
  }

  Widget showBtnComponent() {
    dev.log("showBtnComponent", name: "Widfet test");
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AppWidget.buttonTest(onClick: _moveToPage1, buttonMessage: "Page 1"),
          AppWidget.buttonTest(onClick: _moveToPage2, buttonMessage: "Page 2"),
          AppWidget.buttonTest(onClick: _moveToPage3, buttonMessage: "Page 3"),
        ],
      ),
    );
  }

  void _moveToPage1() {
    Utils.moveToNextScreen(context, const UserStorage());
  }

  void _moveToPage2() {
    Utils.moveToNextScreen(context, const MainMenu());
  }

  void _moveToPage3() {
    Utils.moveToNextScreen(context, const MainMenu());
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
