class RecipeDto {
  final int id;
  final String imgType;
  final String imgPath;
  final String title;
  final String duration;

  RecipeDto.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        imgType = data['img_type'],
        imgPath = data['img_path'],
        title = data['title'],
        duration = data['duration'];
}
