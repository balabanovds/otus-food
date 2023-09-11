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

  IngredientDto.fromJson(this.id, Map<String, dynamic> data)
      : name = data['name'],
        value = data['value'];
}

class StepDto {
  final int id;
  final int stepNumber;
  final bool done;
  final String text;
  final String duration;

  StepDto.fromJson(this.id, Map<String, dynamic> data)
      : stepNumber = data['step_number'],
        done = data['done'],
        text = data['text'],
        duration = data['duration'];
}
