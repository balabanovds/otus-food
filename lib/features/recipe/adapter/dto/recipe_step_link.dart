class RecipeStepLinkDto {
  final int id;
  final int number;
  final int recipeID;
  final int stepID;

  RecipeStepLinkDto.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        number = data['number'],
        recipeID = data['recipe']['id'],
        stepID = data['step']['id'];
}
