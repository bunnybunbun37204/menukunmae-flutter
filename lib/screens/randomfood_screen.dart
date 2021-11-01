import 'dart:math';

import 'package:flutter/material.dart';
import 'package:menukunmae/screens/youtube_player.dart';
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
  late Food whatTheFood;
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
        child: Column(
          children: <Widget>[
            AppWidget.buttonGradient(
                widget: const Text(
                  'What should I have',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Fridaymeduim',
                      fontSize: 20.0),
                ),
                gradient: LinearGradient(
                  colors: <Color>[Colors.orange, Colors.red[800]!],
                ),
                onPressed: (() => _showPopup1())),
                const SizedBox(height: 5.0,),
            const Text('Random the food when you are at lost of what to eat (What should I have)', style: TextStyle(fontSize: 18),)
          ],
        ));
  }

  Widget showButton2() {
    return Container(
        margin: const EdgeInsets.only(left: 225.0, right: 0.2, top: 405.0),
        child: Column(
          children: <Widget>[
            AppWidget.buttonGradient(
                widget: const Text(
                  'What do I have from fridge',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Fridaymeduim',
                      fontSize: 16.0),
                ),
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.red[500]!,
                    Colors.orange,
                  ],
                ),
                onPressed: (() => _showPopup2())),
                 const SizedBox(height: 5.0,),
            const Text('Random the food by using the ingredients from refrigerator (What do I have from fridge)', style: TextStyle(fontSize: 18),)
          ],
        ));
  }

  void _showPopup1() {
    AppWidget.showPopup(
        title: 'Hi',
        content: 'Kuay',
        context: context,
        builder: (BuildContext dialogContext) {
          oldDialogContext = dialogContext;
          List<Food> randomFood =
              Utils.searchFoodList(Config.foods, Config.ingredients);
          final _random = Random();
          Food food = randomFood[_random.nextInt(randomFood.length)];
          whatTheFood = food;
          return MyAlertDialog(
            title: food.getFoodName(),
            content: Image.network(food.getImage()),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: _onDismiss,
                  child: const Text('close'),
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent)),
              ElevatedButton(
                onPressed: (() =>
                    Utils.moveToNextScreen(context, Tutorial(food: whatTheFood,))),
                child: const Text('see tutorial'),
                style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
              ),
            ],
          );
        });
  }

  void _showPopup2() {
    AppWidget.showPopup(
        title: 'Hi',
        content: 'Kuay',
        context: context,
        builder: (BuildContext dialogContext) {
          oldDialogContext = dialogContext;
          try {
            List<Food> randomFood =
                Utils.searchFoodList(Config.foods, Config.userIngredients);
            final _random = Random();
            Food food = randomFood[_random.nextInt(randomFood.length)];
            whatTheFood = food;
            return MyAlertDialog(
                title: food.getFoodName(),
                content: Image.network(food.getImage()),
                actions: <Widget>[
              ElevatedButton(
                  onPressed: _onDismiss,
                  child: const Text('close'),
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent)),
              ElevatedButton(
                onPressed: (() =>
                    Utils.moveToNextScreen(context, Tutorial(food: whatTheFood,))),
                child: const Text('see tutorial'),
                style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
              ),
            ],);
          } catch (e) {
            return MyAlertDialog(
              title: 'errror',
              content: Image.asset('assets/images/error.png'),
              actions: <Widget>[
                IconButton(
                    onPressed: (() => _onDismiss()),
                    icon: Icon(
                      Icons.close,
                      color: Colors.redAccent[700]!,
                    ))
              ],
            );
          }
        });
  }

  Widget showGifImage() {
    return Container(
      width: 400.0,
      height: 300.0,
      margin: const EdgeInsets.only(top: 100.0, left: 20.0),
      child: AppWidget.imageWidget(imagePath: 'assets/images/gificon1.gif'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Center(
              child: Stack(
        children: <Widget>[
          showBackground(),
          showGifImage(),
          showButton(),
          showButton2()
        ],
      ))),
    );
  }
}
