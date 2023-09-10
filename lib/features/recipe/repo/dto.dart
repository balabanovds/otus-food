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

class IngredientDto {
  final int id;
  final String name;
  final String value;

  @override
  String toString() {
    return 'Ingredient: id=$id, name=$name, value=$value';
  }

  IngredientDto.fromJson(this.id, Map<String, dynamic> data)
      : name = data['name'],
        value = data['value'];
}
