import 'package:otus_food/features/recipe/adapter/dto/recipe.dart';
import 'package:otus_food/features/recipe/domain/model/recipe.dart';

class RecipeMapper {
  static Recipe fromAPI(RecipeDto item) {
    return Recipe(item.id, item.imgType, item.imgPath, item.title, item.duration);
  }
}
