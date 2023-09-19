class FreezerDto {
  final int id;
  final int count;
  final int userID;
  final int ingrediantID;

  FreezerDto.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        count = data['count'],
        userID = data['user']['id'],
        ingrediantID = data['ingredient']['id'];
}
