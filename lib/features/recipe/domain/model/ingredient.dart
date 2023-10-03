import 'package:otus_food/features/recipe/domain/model/measure_unit.dart';

class Ingredient {
  final int id;
  final int recipeID;
  final String name;
  final int calories;
  final MeasureUnit _measureUnit;

  Ingredient(this.id, this.recipeID, this.name, this.calories, this._measureUnit);

  String get value => _measureUnit.toString();
}
