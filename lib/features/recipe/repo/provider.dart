import 'package:otus_food/features/recipe/repo/dto.dart';

abstract class RecipeListProvider {
  Future<List<RecipeDto>> recipes();
}

abstract class IngredientsProvider {
  Future<List<IngredientDto>> ingredients(int id);
}
