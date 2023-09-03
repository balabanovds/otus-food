class RecipeDto {
  final int id;
  final String url;
  final String title;
  final String duration;

  RecipeDto.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        url = data['url'],
        title = data['title'],
        duration = data['duration'];
}
