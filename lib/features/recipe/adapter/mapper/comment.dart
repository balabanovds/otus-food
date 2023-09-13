import '../dto/comment.dart';
import '../../domain/model/comment.dart';
import '../../domain/model/user.dart';

class CommentMapper {
  static Comment fromAPI(CommentDto item) {
    return Comment(item.id, item.recipeID, User(item.user.imgType, item.user.imgPath, item.user.name), item.createdAt,
        item.text, item.imgType, item.imgPath);
  }
}
