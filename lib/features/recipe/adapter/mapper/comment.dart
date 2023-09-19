import 'package:otus_food/features/recipe/adapter/dto/user.dart';
import 'package:otus_food/features/recipe/domain/repository/init.dart';

import '../dto/comment.dart';
import '../../domain/model/comment.dart';
import '../../domain/model/user.dart';

class CommentMapper {
  static Comment fromAPI(CommentDto item, UserDto user) {
    return Comment(item.id, item.recipeID, User(imageSource, user.avatar, user.login), item.datetime, item.text,
        imageSource, item.photo);
  }
}
