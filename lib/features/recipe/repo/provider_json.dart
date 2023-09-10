import 'package:otus_food/features/recipe/repo/dto.dart';
import 'package:otus_food/features/recipe/repo/provider.dart';
import 'dart:convert';
import "dart:async";
import 'package:flutter/services.dart';

class JsonProvider implements RecipeListProvider, IngredientsProvider {
  @override
  Future<List<RecipeDto>> recipes() async {
    final String response = await rootBundle.loadString('assets/data/recipes.json');
    final data = json.decode(response);
    final List<dynamic> items = data;

    return items.map((e) => RecipeDto.fromJson(e)).toList();
  }

  @override
  Future<List<IngredientDto>> ingredients(int id) async {
    final String response = await rootBundle.loadString('assets/data/recipes_ingredients.json');
    final data = json.decode(response);
    final List<dynamic> items = data;

    return items.map((e) => _IngredientsDto.fromJson(e)).singleWhere((element) => element.id == id).items;
  }
}

class _IngredientsDto {
  final int id;
  final List<dynamic> _items;

  late List<IngredientDto> items = [];

  bool get isEmpty => items.isEmpty;

  _IngredientsDto.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        _items = data['ingredients'] {
    items = _items.map((e) => IngredientDto.fromJson(id, e)).toList();
  }
}
