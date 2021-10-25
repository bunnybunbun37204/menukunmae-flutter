import 'package:flutter/material.dart';
import 'package:menukunmae/screens/main_menu.dart';
import 'package:menukunmae/tools/utils/utils.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';

//หน้าแรกสุด

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


  Widget showButton() {
    return Container(
      margin: const EdgeInsets.only(left: 70.0, right: 70.0),
      child: AppWidget.buttonGradient(widget: const Text(
    'Start!!',
    style: TextStyle(color: Colors.white, fontFamily: 'Fridaymeduim', fontSize: 30.0),
  ), gradient: LinearGradient(
    colors: <Color>[Colors.orange, Colors.red[800]!],
  ), onPressed: (()=>Utils.moveToNextScreen(context, const MainMenu()))),
    );
  }

  Widget showBackground() {
    return AppWidget.backgroundWidget(imagePath: "assets/images/bg.png");
  }

  Widget showKunmaeIcon() {
    return AppWidget.imageWidget(
        imagePath: "assets/images/gif1.gif", scale: 3.5);
  }

  Widget showComponents() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(
            height: 205.0,
          ),
          Image.asset(
            "assets/images/gif1.gif",
            height: 150.0,
            width: 200.0,
          ),
          const SizedBox(
            height: 130.0,
          ),
          showButton()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Stack(
        alignment: Alignment.center,
        children: <Widget>[showBackground(), showComponents()],
      ))),
    );
  }
}
