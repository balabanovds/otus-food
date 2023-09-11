import 'package:otus_food/repo/entity.dart';

abstract class RecipesProvider {
  Future<List<Recipe>> recipes();
}
