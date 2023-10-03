import 'package:otus_food/features/recipe/adapter/dto/recipe_step_link.dart';

class RecipeStepDto {
  final int id;
  final String name;
  final int duration;
  final List<RecipeStepLinkDto> recipeStepLinks;

  RecipeStepDto(this.id, this.name, this.duration, this.recipeStepLinks);

  factory RecipeStepDto.fromJson(Map<String, dynamic> data) {
    final int id = data['id'];
    final String name = data['name'];
    final int duration = data['duration'];
    final maybeRecipeStepLinks = data['recipeStepLinks'] as List<dynamic>?;
    final List<RecipeStepLinkDto> recipeStepLinks =
        maybeRecipeStepLinks?.map((e) => RecipeStepLinkDto.fromJson(e)).toList() ?? [];

    return RecipeStepDto(id, name, duration, recipeStepLinks);
  }
}
