import 'package:flutter/material.dart';
import 'package:menukunmae/screens/calories_calculate.dart';
import 'package:menukunmae/screens/randomfood_screen.dart';
import 'package:menukunmae/screens/user_storage.dart';
import 'package:menukunmae/tools/utils/utils.dart';
import 'package:menukunmae/tools/widgets/circle.dart';
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

  Widget showButton1() {
    return Container(
      margin: const EdgeInsets.only(left: 100.0, ),
      child: AppWidget.buttonGradient(
          widget: const Text(
            'My fridge',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Fridaymeduim',
                fontSize: 25.0),
          ),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange, Colors.red[800]!],
          ),
          onPressed: (() => Utils.moveToNextScreen(context, const UserStorage()))),
    );
  }

  Widget showButton2() {
    return Container(
      margin: const EdgeInsets.only(left: 100.0, ),
      child: AppWidget.buttonGradient(
          widget: const Text(
            'What should I have',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Fridaymeduim',
                fontSize: 25.0),
          ),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange, Colors.red[800]!],
          ),
          onPressed: (() => Utils.moveToNextScreen(context, const RandomFoodScreen()))),
    );
  }

   Widget showButton3() {
    return Container(
      margin: const EdgeInsets.only(left: 100.0, ),
      child: AppWidget.buttonGradient(
          widget: const Text(
            'Calculate calories',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Fridaymeduim',
                fontSize: 25.0),
          ),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange, Colors.red[800]!],
          ),
          onPressed: (() => Utils.moveToNextScreen(context, const CaloriesCalculate()))),
    );
  }

  Widget showBtnComponent() {
    dev.log("showBtnComponent", name: "Widfet test");
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(
            left: 30.0,
            top: 175.0,
            right: 60.0
          ),
          child: showButton1(),
        ),
        const SizedBox(height: 55.0,),
        Container(
          margin: const EdgeInsets.only(
            left: 75.0,
            right: 35.0
          ),
          child: showButton2(),
        ),
        const SizedBox(height: 70.0,),
        Container(
          margin: const EdgeInsets.only(
            left: 60.0,
            right: 50.0
          ),
          child: showButton3(),
        ),
      ],
    );
  }

  Widget showText() {
    return Container(
      margin: const EdgeInsets.only(left: 0.0),
      child: const Text(
        'Menu',
        style: TextStyle(fontSize: 35.0),
      ),
    );
  }

  Widget showCircle() {
    return SizedBox(
        width: 100.0,
        height: 100.0,
        child: Stack(
          children: <Widget>[
            CustomPaint(
              painter: MakeCircle(
                  strokeCap: StrokeCap.square, strokeWidth: 10.0, radius: 80.0),
            ),
            showText()
          ],
          alignment: AlignmentDirectional.topCenter,
        ));
  }

  Widget showCircleAndMenu() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 30.0),
      child: showCircle(),
    );
  }

  void _moveToPage1() {
    Utils.moveToNextScreen(context, const UserStorage());
  }

  void _moveToPage2() {
    Utils.moveToNextScreen(context, const RandomFoodScreen());
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
    )));
  }
}
