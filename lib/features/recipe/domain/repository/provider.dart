import 'package:otus_food/features/recipe/domain/model/comment.dart';
import 'package:otus_food/features/recipe/domain/model/recipe.dart';
import 'package:otus_food/features/recipe/domain/model/ingredient.dart';
import 'package:otus_food/features/recipe/domain/model/step.dart';

abstract class Provider implements RecipeListProvider, IngredientsProvider, StepsProvider, CommentsProvider {}

abstract class RecipeListProvider {
  Future<List<Recipe>> recipes();
  Future<Recipe> recipe(int id);
}

abstract class IngredientsProvider {
  Future<List<Ingredient>> ingredients(int id);
}

abstract class StepsProvider {
  Future<List<Step>> steps(int id);
}

abstract class CommentsProvider {
  Future<List<Comment>> comments(int recipeID);
}
