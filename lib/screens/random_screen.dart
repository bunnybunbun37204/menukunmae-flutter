import 'package:flutter/material.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';
class Random extends StatefulWidget {
  const Random({ Key? key }) : super(key: key);

  @override
  _RandomState createState() => _RandomState();
}

class _RandomState extends State<Random> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: SafeArea(
          child: Stack(
        children: <Widget>[showBackground() ],
      )),
    );
  }
Widget showBackground() {
    return Container(
        child: AppWidget.backgroundWidget(imagePath: "assets/images/randomboi.png"),
        margin: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5));
  }
  
}