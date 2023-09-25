import 'dart:convert';
import "dart:async";
import 'package:flutter/services.dart';
import 'package:otus_food/features/recipe/adapter/dto/measure_unit.dart';
import 'package:otus_food/features/recipe/adapter/dto/recipe_step.dart';
import 'package:otus_food/features/recipe/adapter/dto/user.dart';
import 'package:otus_food/features/recipe/adapter/mapper/comment.dart';
import 'package:otus_food/features/recipe/domain/model/comment.dart';
import 'package:otus_food/features/recipe/adapter/mapper/step.dart';
import 'package:otus_food/features/recipe/adapter/dto/ingredient.dart';
import 'package:otus_food/features/recipe/adapter/mapper/ingredient.dart';
import 'package:otus_food/features/recipe/adapter/mapper/recipe.dart';
import 'package:otus_food/features/recipe/adapter/dto/recipe.dart';
import 'package:otus_food/features/recipe/domain/model/ingredient.dart';
import 'package:otus_food/features/recipe/domain/model/recipe.dart';
import 'package:otus_food/features/recipe/domain/repository/provider.dart';
import 'package:otus_food/features/recipe/domain/model/step.dart';

class JsonProvider implements Provider {
  Future<void> init() async {}

  @override
  Future<List<Recipe>> recipes() async {
    final String response =
        await rootBundle.loadString('assets/mock/recipes/Recipes.json');
    return (json.decode(response) as List<dynamic>)
        .map((e) => RecipeDto.fromJson(e))
        .map((e) => RecipeMapper.fromAPI(e))
        .toList();
  }

  @override
  Future<Recipe> recipe(int recipeID) async {
    return _recipeDto(recipeID).then((e) => RecipeMapper.fromAPI(e));
  }

  Future<RecipeDto> _recipeDto(int recipeID) async {
    final String response =
        await rootBundle.loadString('assets/mock/recipes/Recipes.json');
    return (json.decode(response) as List<dynamic>)
        .map((e) => RecipeDto.fromJson(e))
        .firstWhere((e) => e.id == recipeID);
  }

  @override
  Future<List<Ingredient>> ingredients(int id) async {
    final String ingRes =
        await rootBundle.loadString('assets/mock/recipes/Ingredients.json');
    final Iterable<IngredientDto> ingIter =
        (json.decode(ingRes) as List<dynamic>)
            .map((e) => IngredientDto.fromJson(e));

    final String muRes =
        await rootBundle.loadString('assets/mock/recipes/MeasureUnit.json');
    final muIter = (json.decode(muRes) as List<dynamic>)
        .map((e) => MeasureUnitDto.fromJson(e));
    final Map<int, MeasureUnitDto> muMap = {for (var e in muIter) e.id: e};

    return ingIter.map((e) {
      if (!e.valid()) {
        throw Exception('ingredient entity has not valid fields, id=${e.id}');
      }

      if (!muMap.containsKey(e.measureUnitID)) {
        throw Exception('invalid MeasureUnit data received');
      }
      final mu = muMap[e.measureUnitID]!;

      if (e.recipeIngredients.isEmpty) {
        throw Exception(
            'ingredient entity has empty recipeIngredients, id=${e.id}');
      }

      return IngredientMapper.fromAPI(
        e,
        mu,
      );
    }).toList();
  }

  @override
  Future<List<Step>> steps(int recipeID) async {
    final String stepRes =
        await rootBundle.loadString('assets/mock/recipes/RecipeSteps.json');
    final stepIter = (json.decode(stepRes) as List<dynamic>)
        .map((e) => RecipeStepDto.fromJson(e));
    final Map<int, RecipeStepDto> stepMap = {for (var e in stepIter) e.id: e};

    final res = await _recipeDto(recipeID);
    return res.stepLinks.map((e) {
      if (!stepMap.containsKey(e.id)) {
        throw Exception('invalid RecipeStep data provided, key not found');
      }

      return StepMapper.fromAPI(stepMap[e.id]!);
    }).toList();
  }

  @override
  Future<List<Comment>> comments(int recipeID) async {
    final String userRes =
        await rootBundle.loadString('assets/mock/recipes/Users.json');
    final userIter =
        (json.decode(userRes) as List<dynamic>).map((e) => UserDto.fromJson(e));
    final Map<int, UserDto> userMap = {for (var e in userIter) e.id: e};

    final res = await _recipeDto(recipeID);

    return res.comments.map((e) {
      if (!userMap.containsKey(e.userID)) {
        throw Exception('invalid Users data provided, key not found');
      }

      return CommentMapper.fromAPI(e, userMap[e.userID]!);
    }).toList();
  }
}
