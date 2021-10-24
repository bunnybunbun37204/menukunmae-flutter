import 'package:flutter/material.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';
class Kcalcal extends StatefulWidget {
  const Kcalcal({ Key? key }) : super(key: key);

  @override
  _KcalcalState createState() => _KcalcalState();
}

class _KcalcalState extends State<Kcalcal> {
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
        child: AppWidget.backgroundWidget(imagePath: "assets/images/kcalcal.png"),
        margin: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5));
  }
  
}