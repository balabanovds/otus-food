import 'package:otus_food/features/recipe/adapter/dto/ingredient.dart';

class MeasureUnitDto {
  final int id;
  final String one;
  final String few;
  final String many;
  final List<IngredientDto> ingredients;

  MeasureUnitDto(this.id, this.one, this.few, this.many, this.ingredients);

  factory MeasureUnitDto.fromJson(Map<String, dynamic> data) {
    final int id = data['id'];
    final String one = data['one'];
    final String few = data['few'];
    final String many = data['many'];
    final maybeIngredients = data['ingredients'] as List<dynamic>?;

    final List<IngredientDto> ingredients = maybeIngredients?.map((e) => IngredientDto.fromJson(e)).toList() ?? [];

    return MeasureUnitDto(id, one, few, many, ingredients);
  }
}
