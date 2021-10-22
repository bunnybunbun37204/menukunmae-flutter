import 'package:flutter/material.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';

// หน้าตู้เย็นของฉัน
class UserStorage extends StatefulWidget {
  const UserStorage({Key? key}) : super(key: key);

  @override
  _UserStorageState createState() => _UserStorageState();
}

class _UserStorageState extends State<UserStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: AppWidget.autoCompleteTextField()
      )),
    );
  }
}
