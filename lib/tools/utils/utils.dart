import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:menukunmae/tools/configs/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../classes/food.dart';

/*
MIT License
Copyright (c) 2021 Bunyawat Naunnak
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
* */

class Utils {
  /// Search the [foods] that matchs with the [ingredients]
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
  static bool _listContainsAll<T>(List<T> a, List<T> b) {
    final setA = Set.of(a);
    return setA.containsAll(b);
  }

  /// Navigate to the [screen]
  static Future<void> moveToNextScreen(
      BuildContext context, Widget screen) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  /// Navigate to the previous screen
  static Future<void> moveToPreviousScreen(BuildContext context) async {
    Navigator.pop(context);
  }

  /// Read JSON File for food
  static Future<void> readJsonFood() async {
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

  /// Read JSON File for ingredients

  static Future<void> readJsonIngredients() async {
    final String source =
        await rootBundle.loadString("assets/data/ingredients.json");
    final dynamic datas = json.decode(source);
    final List<dynamic> data = datas["ingredients"];
    for (int i = 0; i < data.length; i++) {
      final String ingredient = data[i];
      Config.ingredients.add(ingredient);
    }
  }

  static void saveData(
      {required String key, required List<String> value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList(key, value);
  }

  static void getData({required String key}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      Config.userIngredients = sharedPreferences.getStringList(key)!;
    } catch (e) {
      Config.userIngredients = [];
    }
  }

  static void getVdoId() {
    for (Food food in Config.foods) {
      Config.vdoId.add(splitVdoLink(food.getTutorial()));
    }
  }

  static String splitVdoLink(String link) {
    final listLink = link.split("=");
    String id = listLink[1];
    return id;
  }

   static double calculate_BMR(String gender, double weight, double height, int age) {
        double bmr;
        if (gender == "male") {
            bmr = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
        } else {
            bmr = 665 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
        }
        return bmr;
    }

    static double calculate_Cals(double bmr, String activity) {
        switch (activity) {
            case "Stay still , no exercise action":
                bmr *= 1.2;
                break;
            case "Seldom exercise, 1-3 days per week":
                bmr *= 1.375;
                break;
            case "Exercise sometimes, 3-5 days per week":
                bmr *= 1.55;
                break;
            case "Hardly exercise, 6-7 days per week":
                bmr *= 1.725;
                break;
            case "Always exercise, 2 time everyday":
                bmr *= 1.9;
                break;
            default:
                bmr *= 1;
                break;
        }

        return bmr;
    }
}
