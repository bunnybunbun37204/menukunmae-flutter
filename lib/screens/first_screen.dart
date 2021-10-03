import 'package:flutter/material.dart';
import 'dart:developer' as dev;

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
        onLongPress: () {
          dev.log("button long press", name: "test-btn");
        },
        onPressed: () {
          dev.log("button press", name: "test-btn");
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

  Widget showComponents() {
    return Center(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            showAppName(), 
            showButton()],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Stack(
        children: <Widget>[
          showBackground(),
          showComponents()
        ],
      ))),
    );
  }
}
