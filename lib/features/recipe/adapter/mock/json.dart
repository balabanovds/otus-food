import 'dart:convert';
import "dart:async";
import 'package:flutter/services.dart';

import '../../adapter/mapper/step.dart';
import '../../adapter/dto/ingredient.dart';
import '../../adapter/dto/step.dart';
import '../../adapter/mapper/ingredient.dart';
import '../../adapter/mapper/recipe.dart';
import '../../adapter/dto/recipe.dart';
import '../../domain/model/ingredient.dart';
import '../../domain/model/recipe.dart';
import '../../domain/repository/provider.dart';
import '../../domain/model/step.dart';

class JsonProvider implements Provider {
  @override
  Future<List<Recipe>> recipes() async {
    final String response = await rootBundle.loadString('assets/data/recipes.json');
    final data = json.decode(response);
    final List<dynamic> items = data;

    return items.map((e) => RecipeDto.fromJson(e)).map((e) => RecipeMapper.fromAPI(e)).toList();
  }

  @override
  Future<List<Ingredient>> ingredients(int id) async {
    final String response = await rootBundle.loadString('assets/data/recipes_ingredients.json');
    final data = json.decode(response);
    final List<dynamic> items = data;

    return items
        .map((e) => IngredientListDto.fromJson(e))
        .singleWhere((e) => e.id == id)
        .items
        .map((e) => IngredientMapper.fromAPI(e))
        .toList();
  }

  @override
  Future<List<Step>> steps(int id) async {
    final String response = await rootBundle.loadString('assets/data/recipes_steps.json');
    final data = json.decode(response);
    final List<dynamic> items = data;

    return items
        .map((e) => StepListDto.fromJson(e))
        .singleWhere((e) => e.id == id)
        .items
        .map((e) => StepMapper.fromAPI(e))
        .toList();
  }
}
