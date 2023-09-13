import 'dart:convert';
import "dart:async";
import 'package:flutter/services.dart';
import 'package:otus_food/features/recipe/adapter/dto/comment.dart';
import 'package:otus_food/features/recipe/adapter/mapper/comment.dart';
import 'package:otus_food/features/recipe/domain/model/comment.dart';

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
    final String response = await rootBundle.loadString('assets/mock/recipes/list.json');
    final data = json.decode(response);
    final List<dynamic> items = data;

    return items.map((e) => RecipeDto.fromJson(e)).map((e) => RecipeMapper.fromAPI(e)).toList();
  }

  @override
  Future<List<Ingredient>> ingredients(int id) async {
    final String response = await rootBundle.loadString('assets/mock/recipes/ingredients.json');
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
    final String response = await rootBundle.loadString('assets/mock/recipes/steps.json');
    final data = json.decode(response);
    final List<dynamic> items = data;

    return items
        .map((e) => StepListDto.fromJson(e))
        .singleWhere((e) => e.id == id)
        .items
        .map((e) => StepMapper.fromAPI(e))
        .toList();
  }

  @override
  Future<List<Comment>> comments(int recipeID) async {
    final String response = await rootBundle.loadString('assets/mock/recipes/comments.json');
    final data = json.decode(response);
    final List<dynamic> items = data;

    return items
        .map((e) => CommentDto.fromJson(e))
        .where((e) => e.recipeID == recipeID)
        .map((e) => CommentMapper.fromAPI(e))
        .toList();
  }
}
