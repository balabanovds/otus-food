class CommentDto {
  final int id;
  final int recipeID;
  final UserDto user;
  final String createdAt;
  final String text;
  final String imgType;
  final String imgPath;

  CommentDto.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        recipeID = data['recipe_id'],
        user = UserDto.fromJson(data['user']),
        createdAt = data['created_at'],
        text = data['text'],
        imgType = data['img_type'],
        imgPath = data['img_path'];
}

class UserDto {
  final String imgType;
  final String imgPath;
  final String name;

  UserDto.fromJson(Map<String, dynamic> data)
      : imgType = data['img_type'],
        imgPath = data['img_path'],
        name = data['name'];
}
