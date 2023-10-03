class FavoriteDto {
  final int id;
  final int recipeID;
  final int userID;

  FavoriteDto(this.id, this.recipeID, this.userID);

  FavoriteDto.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        recipeID = data['recipe']['id'],
        userID = data['user']['id'];
}
