import 'package:flutter/material.dart';
import 'package:menukunmae/screens/first_screen.dart';
import 'package:menukunmae/tools/configs/config.dart';
import 'package:menukunmae/tools/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utils.readJsonFood();
    Utils.readJsonIngredients();
    Utils.getData(key: "user_ingredients");
    Utils.getVdoId();
    return MaterialApp(
      home: const FirstScreen(),
      theme: ThemeData(fontFamily: "Fridaymeduim"),
    );
  }
}
