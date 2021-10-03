import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:menukunmae/tools/configs/config.dart';

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

  static Future<void> readJson() async {
    final String source = await rootBundle.loadString("assets/data/food.json");
    final dynamic datas = json.decode(source);
    final dynamic data = datas["datas"];
    for (int i = 0; i < data.length; i++) {
      final String foodName = data[i]["food_name"];
      final List<dynamic> foodIngredients = data[i]["food_ingredients"];
      final List<dynamic> cookingMethod = data[i]["cooking_method"];
      final List<dynamic> foodVol = data[i]["food_vol"];
      final int cals = data[i]["food_cals"];
      final String image = data[i]["food_img"];
      final String tutorial = data[i]["tutorial"];
      Food food = Food(foodName, cals, foodIngredients, cookingMethod, image,
          tutorial, foodVol);
      Config.foods.add(food);
    }
  }
}
