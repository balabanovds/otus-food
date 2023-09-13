import '../dto/recipe.dart';
import '../../domain/model/recipe.dart';

class RecipeMapper {
  static Recipe fromAPI(RecipeDto item) {
    return Recipe(item.id, item.imgType, item.imgPath, item.title, item.duration);
  }
}
