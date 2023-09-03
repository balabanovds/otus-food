import 'package:otus_food/repo/dto.dart';

abstract class RecipesProvider {
  Future<List<RecipeDto>> recipes();
}
