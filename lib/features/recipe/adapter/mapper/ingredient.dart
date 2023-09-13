import '../../adapter/dto/ingredient.dart';
import '../../domain/model/ingredient.dart';

class IngredientMapper {
  static Ingredient fromAPI(IngredientDto item) {
    return Ingredient(item.id, item.name, item.value);
  }
}
