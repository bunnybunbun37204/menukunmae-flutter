import 'package:flutter/material.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  
  Widget showBackground() {
    return AppWidget.backgroundWidget(imagePath: "assets/images/bg_2.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: Stack(
        children: <Widget>[
          showBackground()
        ],
      ))),
    );
  }
}
