import 'package:otus_food/features/recipe/adapter/dto/comment.dart';
import 'package:otus_food/features/recipe/adapter/dto/favorite.dart';
import 'package:otus_food/features/recipe/adapter/dto/freezer.dart';

class UserDto {
  final int id;
  final String login;
  final String password;
  final String token;
  final String avatar;
  final List<FreezerDto> freezers;
  final List<FavoriteDto> favorites;
  final List<CommentDto> comments;

  UserDto(this.id, this.login, this.password, this.token, this.avatar, this.favorites, this.freezers, this.comments);

  factory UserDto.fromJson(Map<String, dynamic> data) {
    final int id = data['id'];
    final String login = data['login'];
    final String password = data['password'];
    final String token = data['token'];
    final String avatar = data['avatar'];

    final maybeFreezers = data['userFreezer'] as List<dynamic>?;
    final maybeFavorites = data['favoriteRecipes'] as List<dynamic>?;
    final maybeComments = data['comments'] as List<dynamic>?;

    final List<FavoriteDto> favorites = maybeFavorites?.map((e) => FavoriteDto.fromJson(e)).toList() ?? [];
    final List<FreezerDto> freezers = maybeFreezers?.map((e) => FreezerDto.fromJson(e)).toList() ?? [];
    final List<CommentDto> comments = maybeComments?.map((e) => CommentDto.fromJson(e)).toList() ?? [];

    return UserDto(id, login, password, token, avatar, favorites, freezers, comments);
  }
}
