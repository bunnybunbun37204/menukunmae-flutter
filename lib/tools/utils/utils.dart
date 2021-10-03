import 'package:flutter/material.dart';

import '../classes/food.dart';

class Utils {
  /// Search the [foods] that matchs with the [ingredients]
  ///
  /// author `Bunyawat Naunnak`
  static List<Food> searchFoodList(List<Food> foods, List<String> ingredients) {
    List<Food> output = [];
    for (Food food in foods) {
      bool result = Utils._listContainsAll(ingredients, food.getIngredients());
      if (result) {
        output.add(food);
      }
    }
    return output;
  }

  /// Search the list [a] contains all list [b]
  ///
  /// author `Bunyawat Naunnak`
  static bool _listContainsAll<T>(List<T> a, List<T> b) {
    final setA = Set.of(a);
    return setA.containsAll(b);
  }

  /// Navigate to the [screen]
  ///
  /// author `Bunyawat Naunnak`
  static Future<void> moveToNextScreen(
      BuildContext context, Widget screen) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  /// Navigate to the previous screen
  ///
  /// author `Bunyawat Naunnak`
  static Future<void> moveToPreviousScreen(BuildContext context) async {
    Navigator.pop(context);
  }
}
