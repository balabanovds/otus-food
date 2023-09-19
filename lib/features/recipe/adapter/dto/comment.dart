class CommentDto {
  final int id;
  final String text;
  final String photo;
  final DateTime datetime;
  final int userID;
  final int recipeID;

  CommentDto(this.id, this.text, this.photo, this.datetime, this.userID, this.recipeID);

  factory CommentDto.fromJson(Map<String, dynamic> data) {
    final int id = data['id'];
    final String text = data['text'];
    final String photo = data['photo'];
    final DateTime datetime = DateTime.tryParse(data['datetime'] as String) ?? DateTime.utc(1970);
    final int userID = data['user']['id'];
    final int recipeID = data['recipe']['id'];

    return CommentDto(id, text, photo, datetime, userID, recipeID);
  }
}
