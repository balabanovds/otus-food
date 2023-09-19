import 'package:otus_food/features/recipe/domain/repository/init.dart';
import 'package:otus_food/features/recipe/adapter/dto/recipe.dart';
import 'package:otus_food/features/recipe/domain/model/recipe.dart';

class RecipeMapper {
  static Recipe fromAPI(RecipeDto item) {
    return Recipe(item.id, imageSource, item.photo, item.name, Duration(seconds: item.duration));
  }
}
