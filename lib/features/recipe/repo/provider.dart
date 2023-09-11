import 'package:otus_food/features/recipe/repo/dto.dart';

abstract class Provider implements RecipeListProvider, IngredientsProvider, StepsProvider {}

abstract class RecipeListProvider {
  Future<List<RecipeDto>> recipes();
}

abstract class IngredientsProvider {
  Future<List<IngredientDto>> ingredients(int id);
}

abstract class StepsProvider {
  Future<List<StepDto>> steps(int id);
}
