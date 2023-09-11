import 'package:otus_food/repo/entity.dart';
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

    return items.map((e) => Recipe.fromJson(e)).toList();
  }
}
