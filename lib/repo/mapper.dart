import 'package:otus_food/model/recipe.dart';
import 'package:otus_food/repo/entity.dart';

class RecipeMapper {
  static Recipe fromAPI(RecipeDto o) {
    return Recipe(o.id, o.imgType, o.imgPath, o.title, o.duration);
  }
}
