import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menukunmae/tools/classes/food.dart';
import 'package:menukunmae/tools/configs/config.dart';
import 'package:menukunmae/tools/utils/utils.dart';
import 'package:menukunmae/tools/widgets/alertdialog.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';

class RandomFoodScreen extends StatefulWidget {
  const RandomFoodScreen({Key? key}) : super(key: key);

  @override
  _RandomFoodScreenState createState() => _RandomFoodScreenState();
}

class _RandomFoodScreenState extends State<RandomFoodScreen> {
  late BuildContext? oldDialogContext;

  void _onDismiss() {
    if (oldDialogContext != null) {
      Navigator.of(oldDialogContext!).pop();
    }
    oldDialogContext = null;
  }

  Widget showBackground() {
    return AppWidget.backgroundWidget(imagePath: "assets/images/randomboi.png");
  }

    Widget showButton() {
    return Container(
      margin: const EdgeInsets.only(left: 0.2, right: 250.0, top: 405.0),
      child: AppWidget.buttonGradient(widget: const Text(
    'Random1',
    style: TextStyle(color: Colors.white, fontFamily: 'Fridaymeduim', fontSize: 30.0),
  ), gradient: LinearGradient(
    colors: <Color>[Colors.orange, Colors.red[800]!],
  ), onPressed: (()=>_showPopup1())),
    );
  }

    Widget showButton2() {
    return Container(
      margin: const EdgeInsets.only(left: 250, right: 0.0, top: 405.0),
      child: AppWidget.buttonGradient(widget: const Text(
    'Random2',
    style: TextStyle(color: Colors.white, fontFamily: 'Fridaymeduim', fontSize: 30.0),
  ), gradient: LinearGradient(
    colors: <Color>[ Colors.red[500]!,Colors.orange,],
  ), onPressed: (()=>_showPopup1())),
    );
  }

  void _showPopup1() {
    AppWidget.showPopup(
        title: 'Hi',
        content: 'Kuay',
        context: context,
        builder: (BuildContext dialogContext) {
          oldDialogContext = dialogContext;
          Future.delayed(const Duration(seconds: 2), _onDismiss);
          List<Food> randomFood =
              Utils.searchFoodList(Config.foods, Config.ingredients);
          final _random = Random();
          Food food = randomFood[_random.nextInt(randomFood.length)];
          return MyAlertDialog(title: food.getFoodName(), content: 'Hello');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Stack(
        children: <Widget>[
          showBackground(),
          showButton(),
          showButton2()
        ],
      ))),
    );
  }
}
