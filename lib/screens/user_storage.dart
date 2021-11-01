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
          decoration: const InputDecoration(
            hintText: "Search menu",
          ),
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
                textEditingController.clear();
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
              return Container(
                margin: const EdgeInsets.only(left: 120.0, right: 10.0),
                child: ListTile(
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
                ),
              );
            },
            separatorBuilder: (context, int index) {
              return const Divider();
            },
            itemCount: Config.userIngredients.length));
  }

  Widget showBackground() {
    return AppWidget.backgroundWidget(imagePath: 'assets/images/userstor.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(
        children: <Widget>[
          showBackground(),
          Column(children: <Widget>[
            Container(
              margin:
                  const EdgeInsets.only(top: 105.0, left: 120.0, right: 90.0),
              child: searchIngredients(),
            ),
            Container(
              child: listViewWidget(),
            )
          ])
        ],
      )),
    );
  }
}
