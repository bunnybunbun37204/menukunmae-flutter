import 'package:flutter/material.dart';
import 'package:menukunmae/tools/configs/config.dart';
import 'package:menukunmae/tools/utils/utils.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';

// หน้าตู้เย็นของฉัน
class UserStorage extends StatefulWidget {
  const UserStorage({Key? key}) : super(key: key);

  @override
  _UserStorageState createState() => _UserStorageState();
}

class _UserStorageState extends State<UserStorage> {
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
              } else if (Config.userIngredients.contains(ingredient)) {
                AppWidget.makeToast(
                    message: "this is existing ingredients please type others",
                    context: context);
              } else {
                AppWidget.makeToast(
                    message: "add ingredient $ingredient to user list",
                    context: context);
                Config.userIngredients.add(ingredient);
                Utils.saveData(
                    key: "user_ingredients", value: Config.userIngredients);
              }
            });
          },
        );
      },
    );
  }

  Widget listViewWidget() {
    return Expanded(
        child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, int index) {
              return ListTile(
                onTap: (() => {
                      Config.value = Config.userIngredients[index],
                      AppWidget.makeToast(
                          message: Config.userIngredients[index],
                          context: context)
                    }),
                title: Text(Config.userIngredients[index]),
                trailing: Wrap(
                  children: <Widget>[
                    IconButton(
                        onPressed: (() => {
                              setState(() {
                                AppWidget.makeToast(
                                    message:
                                        "delete ${Config.userIngredients[index]}",
                                    context: context);
                                Config.userIngredients.removeAt(index);
                                Utils.saveData(
                                    key: "user_ingredients",
                                    value: Config.userIngredients);
                              })
                            }),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red.shade700,
                        ))
                  ],
                ),
              );
            },
            separatorBuilder: (context, int index) {
              return const Divider();
            },
            itemCount: Config.userIngredients.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            Column(children: <Widget>[searchIngredients(), listViewWidget()]),
      ),
    );
  }
}
