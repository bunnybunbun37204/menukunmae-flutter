import 'package:flutter/material.dart';
import 'package:menukunmae/tools/configs/config.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';

// หน้าตู้เย็นของฉัน
class UserStorage extends StatefulWidget {
  const UserStorage({Key? key}) : super(key: key);

  @override
  _UserStorageState createState() => _UserStorageState();
}

class _UserStorageState extends State<UserStorage> {
  void _onTapDelete() {
    setState(() {
      Config.userIngredients.remove(Config.value);
    });
    AppWidget.makeToast(message: "remove ${Config.value}", context: context);
  }

  Widget searchIngredients() {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return Config.ingredients.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          onEditingComplete: onFieldSubmitted,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              hintText: "Search menu",
              prefixIcon: const Icon(Icons.search)),
          onSubmitted: (String ingredient) {
            setState(() {
              if (!Config.ingredients.contains(ingredient)) {
                AppWidget.makeToast(
                    message: "not found this ingredients", context: context);
              } else {
                AppWidget.makeToast(
                    message: "add ingredient $ingredient to user list",
                    context: context);
                Config.userIngredients.add(ingredient);
              }
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          searchIngredients(),
          AppWidget.listViewWidget(
              datas: Config.userIngredients,
              context: context,
              onTapDelete: (() => _onTapDelete()))
        ]),
      ),
    );
  }
}
