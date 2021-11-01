import 'package:flutter/material.dart';

import 'package:menukunmae/tools/configs/config.dart';
import 'package:menukunmae/tools/widgets/widgets.dart';

class AutocompleteTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;

  const AutocompleteTextField(
      {Key? key, required this.hintText, required this.icon})
      : super(key: key);

  static final List<String> _kOptions = Config.ingredients;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text);
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
              hintText: hintText,
              prefixIcon: Icon(icon)),
          onSubmitted: (String ingredient) {
            if (!Config.ingredients.contains(ingredient)) {
              AppWidget.makeToast(
                  message: "not found this ingredients", context: context);
            } else {
              AppWidget.makeToast(
                  message: "add ingredient $ingredient to user list",
                  context: context);
              Config.userIngredients.add(ingredient);
            }
          },
        );
      },
    );
  }
}
