import 'package:otus_food/model/recipe.dart';

abstract class RecipesProvider {
  Future<List<Recipe>> recipes();
}
