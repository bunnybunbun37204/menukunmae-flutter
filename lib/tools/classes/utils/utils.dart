import '../food.dart';

class Utils {
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

  static bool _listContainsAll<T>(List<T> a, List<T> b) {
    final setA = Set.of(a);
    return setA.containsAll(b);
  }
}