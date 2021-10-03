// ignore_for_file: non_constant_identifier_names

class Food {
  late final String _food_name, _image, _tutorial;
  late final List<String> _food_ingredients, _cooking_method;
  late final double _cals;

  //Constructor
  Food(this._food_name, this._cals, this._food_ingredients,
      this._cooking_method, this._image, this._tutorial);

  Food.empty();

  Food.name(String foodName) {
    _food_name = foodName;
  }

  //Setter
  void setFoodName(String foodName) => _food_name = foodName;

  void setImage(String image) => _image = image;

  void setTutorial(String tutorial) => _tutorial = tutorial;

  void setCals(double cals) => _cals = cals;

  void setFoodIngredients(List<String> foodIngredients) =>
      _food_ingredients = foodIngredients;

  void setCookingMethod(List<String> cookingMethod) =>
      _cooking_method = cookingMethod;

  //Getter
  String getFoodName() => _food_name;

  String getImage() => _image;

  String getTutorial() => _tutorial;

  List<String> getIngredients() => _food_ingredients;

  List<String> getCookingMethod() => _cooking_method;

  double getCals() => _cals;

  //special
  Map<String, dynamic> toMap() {
    return Map.of({
      "food_name": _food_name,
      "food_ingredients": _food_ingredients,
      "cooking_method": _cooking_method,
      "food_cals": _cals,
      "image": _image,
      "tutorial": _tutorial
    });
  }
}