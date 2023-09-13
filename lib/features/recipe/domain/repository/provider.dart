import '../../adapter/mock/json.dart';
import '../model/recipe.dart';
import '../model/ingredient.dart';
import '../model/step.dart';

// Make DI here
final Provider provider = JsonProvider();

abstract class Provider implements RecipeListProvider, IngredientsProvider, StepsProvider {}

abstract class RecipeListProvider {
  Future<List<Recipe>> recipes();
}

abstract class IngredientsProvider {
  Future<List<Ingredient>> ingredients(int id);
}

abstract class StepsProvider {
  Future<List<Step>> steps(int id);
}
