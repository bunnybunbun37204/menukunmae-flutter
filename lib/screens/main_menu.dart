import 'package:flutter/material.dart';
import 'package:menukunmae/screens/cal_screen.dart';
import 'package:menukunmae/screens/random_screen.dart';
import 'package:menukunmae/screens/user_storage.dart';
import 'package:menukunmae/tools/utils/utils.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';
import 'dart:developer' as dev;

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  Widget showBackground() {
    return Container(
        child: AppWidget.backgroundWidget(imagePath: "assets/images/menu1.png"),
        margin: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5));
  }

  Widget showBtnComponent() {
    dev.log("showBtnComponent", name: "Widfet test");
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AppWidget.buttonTest(
              onClick: _moveToPage1, buttonMessage: "ตู้เย็นของฉัน"),
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
    Utils.moveToNextScreen(context, const Random());
  }

  void _moveToPage3() {
    Utils.moveToNextScreen(context, const Kcalcal());
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
