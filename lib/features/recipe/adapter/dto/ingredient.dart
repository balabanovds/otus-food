import 'package:otus_food/features/recipe/adapter/dto/freezer.dart';
import 'package:otus_food/features/recipe/adapter/dto/recipe_ingredient.dart';

class IngredientDto {
  final int id;
  final String name;
  final int caloriesForUnit;
  final int measureUnitID;
  final List<RecipeIngredientDto> recipeIngredients;
  final List<FreezerDto> freezers;

  IngredientDto(this.id, this.name, this.caloriesForUnit, this.measureUnitID, this.recipeIngredients, this.freezers);

  bool valid() {
    if (measureUnitID == 0) {
      return false;
    }

    if (id == 0) {
      return false;
    }

    return true;
  }

  factory IngredientDto.fromJson(Map<String, dynamic> data) {
    final int id = data['id'];
    final String name = data['name'];
    final int caloriesForUnit = data['caloriesForUnit'];
    final int measureUnitID = data['measureUnit']['id'];
    final maybeRecipeIngredients = data['recipeIngredients'] as List<dynamic>?;
    final maybeFreezers = data['ingredientFreezer'] as List<dynamic>?;

    final List<RecipeIngredientDto> recipeIngredients =
        maybeRecipeIngredients?.map((e) => RecipeIngredientDto.fromJson(e)).toList() ?? [];

    final List<FreezerDto> freezers = maybeFreezers?.map((e) => FreezerDto.fromJson(e)).toList() ?? [];

    return IngredientDto(id, name, caloriesForUnit, measureUnitID, recipeIngredients, freezers);
  }
}
