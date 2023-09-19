import 'package:otus_food/features/recipe/adapter/dto/measure_unit.dart';
import 'package:otus_food/features/recipe/domain/model/measure_unit.dart';

import '../dto/ingredient.dart';
import '../../domain/model/ingredient.dart';

class IngredientMapper {
  static Ingredient fromAPI(IngredientDto i, MeasureUnitDto mu) {
    var ri = i.recipeIngredients[0];
    return Ingredient(
      i.id,
      ri.recipeID,
      i.name,
      i.caloriesForUnit,
      MeasureUnit(mu.id, mu.one, mu.few, mu.many, ri.count),
    );
  }
}
