import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:menukunmae/screens/main_menu.dart';

import 'package:menukunmae/tools/utils/utils.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  // Widget components
  // author WFH.

  Widget showAppName() {
    return Text(
      "Welcome To MenuKunmae",
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buttonTest() {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      shadowColor: Colors.blueAccent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );

    return ElevatedButton(
        child: const Text(
          'Press Me',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: "Fridaymeduim"),
        ),
        onPressed: () {
          Utils.moveToNextScreen(context, const MainMenu())
              .then((value) => dev.log("go next page", name: "navigator-push"))
              .catchError((err) => dev.log("error", error: err));
        },
        style: style);
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[buttonTest()],
    );
  }

  Widget showBackground() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover)),
    );
  }

  Widget showKunmaeIcon() {
    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/kunmae.png"))),
    );
  }

  Widget showComponents() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(
            height: 400.0,
          ),
          showAppName(),
          showButton()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Utils.readJson();
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Stack(
        children: <Widget>[
          showBackground(),
          showKunmaeIcon(),
          showComponents()
        ],
      ))),
    );
  }
}
