import 'package:flutter/material.dart';
import 'package:menukunmae/tools/configs/config.dart';
import 'package:menukunmae/tools/utils/utils.dart';
import 'package:menukunmae/tools/widgets/alertdialog.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';

class CaloriesCalculate extends StatefulWidget {
  const CaloriesCalculate({Key? key}) : super(key: key);

  @override
  _CaloriesCalculateState createState() => _CaloriesCalculateState();
}

class _CaloriesCalculateState extends State<CaloriesCalculate> {
  final _formKey = GlobalKey<FormState>();
  late BuildContext? oldDialogContext;
  String dropdownValueGender = 'Male';
  String dropdownValueActivity = 'Stay still , no exercise action';

  double weight = 0.0;
  double height = 0.0;
  int age = 0;

  @override
  void initState() {
    super.initState();
    oldDialogContext = context;
  }

  Widget showBackGround() {
    return AppWidget.backgroundWidget(imagePath: 'assets/images/kcalcal.png');
  }

  Widget dropDown() {
    return DropdownButton<String>(
      value: dropdownValueGender,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(
          color: Colors.black87, fontFamily: 'Fridaymeduim', fontSize: 18.0),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueGender = newValue!;
        });
      },
      items: <String>['Male', 'Female']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget dropDownActivity() {
    return DropdownButton<String>(
      value: dropdownValueActivity,
      icon: const Icon(
        Icons.arrow_downward,
        color: Colors.white,
      ),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(
          color: Colors.black87, fontFamily: 'Fridaymeduim', fontSize: 18.0),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValueActivity = newValue!;
        });
      },
      items: <String>[
        'Stay still , no exercise action',
        'Seldom exercise, 1-3 days per week',
        'Exercise sometimes, 3-5 days per week',
        'Hardly exercise, 6-7 days per week',
        'Always exercise, 2 time everyday'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget textFieldWeight() {
    return SizedBox(
      width: 120.0,
      child: TextFormField(
        style: const TextStyle(fontSize: 20.0),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(hintText: "Weight"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your weight';
          }
          weight = double.parse(value);
          return null;
        },
      ),
    );
  }

  Widget textFieldWeightHeight() {
    return SizedBox(
      width: 120.0,
      child: TextFormField(
        style: const TextStyle(fontSize: 20.0),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(hintText: "Height"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your height';
          }
          height = double.parse(value);
          return null;
        },
      ),
    );
  }

  Widget textFieldWeightAge() {
    return SizedBox(
      width: 120.0,
      child: TextFormField(
        style: const TextStyle(fontSize: 20.0),
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(hintText: "Age"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your age';
          }
          age = int.parse(value);
          return null;
        },
      ),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.deepOrange),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _showPopup1();
          }
        },
        child: const Text('Calculate',
            style: TextStyle(
              fontFamily: 'Fridaymeduim',
              fontSize: 15.0,
            )));
  }

  void _showPopup1() {
    AppWidget.showPopup(
        title: 'Hi',
        content: 'Kuay',
        context: context,
        builder: (BuildContext dialogContext) {
          double bmr =
              Utils.calculate_BMR(dropdownValueGender, weight, height, age);
          double calories = Utils.calculate_Cals(bmr, dropdownValueActivity);
          return MyAlertDialog(
            title: "${calories.toStringAsFixed(2)} kcal",
            content: Image.asset(
                "assets/images/gificon1.gif"),
            actions: <Widget>[
              ElevatedButton(
                  onPressed: (()=>Navigator.of(context).pop()),
                  child: const Text('close'),
                  style: ElevatedButton.styleFrom(primary: Colors.redAccent)),
            ],
          );
        });
  }

  void _onDismiss() {
    if (oldDialogContext != null) {
      Navigator.of(oldDialogContext!).pop();
    }
    oldDialogContext = null;
  }

  Widget showComponent() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
                margin:
                    const EdgeInsets.only(top: 100, left: 50.0, right: 100.0),
                child: const Text(
                  'Calories Calculator',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(top: 45, left: 0.0, right: 150.0),
                child: const Text(
                  'Gender',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
            Container(
                margin: const EdgeInsets.only(top: 3, left: 0.0, right: 150.0),
                child: dropDown()),
            Container(
                margin: const EdgeInsets.only(top: 5, left: 0.0, right: 150.0),
                child: const Text(
                  'Weight',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
            Container(
                margin:
                    const EdgeInsets.only(top: 0.0, left: 10.0, right: 120.0),
                child: textFieldWeight()),
            Container(
                margin: const EdgeInsets.only(top: 0, left: 0.0, right: 150.0),
                child: const Text(
                  'Height',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
            Container(
                margin: const EdgeInsets.only(top: 0, left: 30.0, right: 150.0),
                child: textFieldWeightHeight()),
            Container(
                margin: const EdgeInsets.only(top: 0, left: 0.0, right: 200.0),
                child: const Text(
                  'Age',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
            Container(
                margin: const EdgeInsets.only(top: 0, left: 30.0, right: 150.0),
                child: textFieldWeightAge()),
            Container(
                margin: const EdgeInsets.only(top: 2, left: 0.0, right: 150.0),
                child: const Text(
                  'Activity',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                )),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 45.0),
                child: dropDownActivity()),
            Container(
                margin: const EdgeInsets.only(top: 10, left: 300.0, right: 0.0),
                child: submitButton()),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: <Widget>[showBackGround(), showComponent()],
      )),
    );
  }
}
