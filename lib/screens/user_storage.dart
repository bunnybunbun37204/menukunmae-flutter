import 'package:flutter/material.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';

class UserStorage extends StatefulWidget {
  const UserStorage({Key? key}) : super(key: key);

  @override
  _UserStorageState createState() => _UserStorageState();
}

class _UserStorageState extends State<UserStorage> {
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
        child: AppWidget.backgroundWidget(imagePath: "assets/images/userstor.png"),
        margin: const EdgeInsets.symmetric(vertical: 0.5, horizontal: 0.5));
  }
  
}
