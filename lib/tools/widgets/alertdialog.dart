import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<Widget> actions;

  const MyAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    this.actions = const [],
  }) : super(key: key);

  static show({required BuildContext context, required WidgetBuilder builder}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: builder,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      actions: actions,
      content: Text(content, style: Theme.of(context).textTheme.bodyText1),
    );
  }
}
