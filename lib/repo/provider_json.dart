import 'package:otus_food/model/recipe.dart';
import 'package:otus_food/repo/entity.dart';
import 'package:otus_food/repo/mapper.dart';
import 'package:otus_food/repo/provider.dart';
import 'dart:convert';
import "dart:async";
import 'package:flutter/services.dart';

class JsonRecipesProvider implements RecipesProvider {
  @override
  Future<List<Recipe>> recipes() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final data = json.decode(response);
    final List<dynamic> items = data['items'];

    return items
        .map((e) => RecipeDto.fromJson(e))
        .map((e) => RecipeMapper.fromAPI(e))
        .toList();
  }
}
