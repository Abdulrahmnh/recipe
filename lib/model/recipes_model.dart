import 'dart:convert';

AllRecipes allRecipesFromJson(String str) => AllRecipes.fromJson(json.decode(str));

String allRecipesToJson(AllRecipes data) => json.encode(data.toJson());

class AllRecipes {
  AllRecipes({
    required this.success,
    required this.recipes,
  });

  bool success;
  List<Recipe> recipes;

  factory AllRecipes.fromJson(Map<String, dynamic> json) => AllRecipes(
    success: json["success"],
    recipes: List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
  };
}

class Recipe {
  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.kCal,
    this.directions,
    this.ingredients,
    required this.isPersonal,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String name;
  String description;
  int kCal;
  dynamic directions;
  dynamic ingredients;
  String isPersonal;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    kCal: json["kCal"],
    directions: List<String>.from(json["directions"].map((x) => x)),
    ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
    isPersonal: json["isPersonal"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "kCal": kCal,
    "directions": List<String>.from(directions.map((x) => x)),
    "ingredients": List<String>.from(ingredients.map((x) => x.toJson())),
    "isPersonal": isPersonal,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class Ingredient {
  Ingredient({
    required this.name,
    required this.quantity,
    required this.id,
  });

  String name;
  String quantity;
  String id;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    name: json["name"],
    quantity: json["quantity"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "quantity": quantity,
    "_id": id,
  };
}
