import 'package:otus_food/features/recipe/adapter/dto/comment.dart';
import 'package:otus_food/features/recipe/adapter/dto/favorite.dart';
import 'package:otus_food/features/recipe/adapter/dto/recipe_ingredient.dart';
import 'package:otus_food/features/recipe/adapter/dto/recipe_step_link.dart';

class RecipeDto {
  final int id;
  final String name;
  final int duration;
  final String photo;
  final List<RecipeIngredientDto> ingredients;
  final List<RecipeStepLinkDto> stepLinks;
  final List<FavoriteDto> favorites;
  final List<CommentDto> comments;

  RecipeDto(
      this.id, this.name, this.duration, this.photo, this.ingredients, this.stepLinks, this.favorites, this.comments);

  factory RecipeDto.fromJson(Map<String, dynamic> data) {
    final int id = data['id'];
    final String name = data['name'];
    final int duration = data['duration'];
    final String photo = data['photo'];
    final maybeIngredients = data['recipeIngredients'] as List<dynamic>?;
    final maybeStepLinks = data['recipeStepLinks'] as List<dynamic>?;
    final maybeFavorites = data['favoriteRecipes'] as List<dynamic>?;
    final maybeComments = data['comments'] as List<dynamic>?;

    final List<RecipeIngredientDto> ingredients =
        maybeIngredients?.map((e) => RecipeIngredientDto.fromJson(e)).toList() ?? [];
    final List<RecipeStepLinkDto> stepLinks = maybeStepLinks?.map((e) => RecipeStepLinkDto.fromJson(e)).toList() ?? [];
    final List<FavoriteDto> favorites = maybeFavorites?.map((e) => FavoriteDto.fromJson(e)).toList() ?? [];
    final List<CommentDto> comments = maybeComments?.map((e) => CommentDto.fromJson(e)).toList() ?? [];

    return RecipeDto(id, name, duration, photo, ingredients, stepLinks, favorites, comments);
  }
}
