import 'package:flutter/material.dart';
import 'dart:developer' as dev;

import 'package:menukunmae/tools/configs/config.dart';

class AutocompleteTextField extends StatelessWidget {
  const AutocompleteTextField({Key? key}) : super(key: key);

  static final List<String> _kOptions = Config.ingredients;

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return _kOptions.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
      onSelected: (String selection) {
        dev.log('You just selected $selection', name: 'test auto complete');
      },
    );
  }
}
