class RecipeIngredientDto {
  final int id;
  final double count;
  final int ingredientID;
  final int recipeID;

  RecipeIngredientDto.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        count = data['count'],
        ingredientID = data['ingredient']['id'],
        recipeID = data['recipe']['id'];
}
