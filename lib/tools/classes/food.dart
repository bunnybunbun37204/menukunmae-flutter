// ignore_for_file: non_constant_identifier_names

class Food {
  late final String _food_name, _image, _tutorial;
  late final List<dynamic> _food_ingredients, _cooking_method, _food_vol;
  late final int _cals;

  //Constructor
  Food(this._food_name, this._cals, this._food_ingredients,
      this._cooking_method, this._image, this._tutorial, this._food_vol);

  Food.empty();

  Food.name(String foodName) {
    _food_name = foodName;
  }

  //Setter
  void setFoodName(String foodName) => _food_name = foodName;

  void setImage(String image) => _image = image;

  void setTutorial(String tutorial) => _tutorial = tutorial;

  void setCals(int cals) => _cals = cals;

  void setFoodIngredients(List<dynamic> foodIngredients) =>
      _food_ingredients = foodIngredients;

  void setFoodVol(List<dynamic> foodVol) =>
      _food_vol = foodVol;

  void setCookingMethod(List<dynamic> cookingMethod) =>
      _cooking_method = cookingMethod;

  //Getter
  String getFoodName() => _food_name;

  String getImage() => _image;

  String getTutorial() => _tutorial;

  List<dynamic> getIngredients() => _food_ingredients;

  List<dynamic> getVol() => _food_vol;

  List<dynamic> getCookingMethod() => _cooking_method;

  int getCals() => _cals;

  //special
  Map<String, dynamic> toMap() {
    return Map.of({
      "food_name": _food_name,
      "food_ingredients": _food_ingredients,
      "food_vol":_food_vol,
      "cooking_method": _cooking_method,
      "food_cals": _cals,
      "image": _image,
      "tutorial": _tutorial
    });
  }
}