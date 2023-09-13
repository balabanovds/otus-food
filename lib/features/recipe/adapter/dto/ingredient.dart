class IngredientDto {
  final int id;
  final String name;
  final String value;

  IngredientDto.fromJson(this.id, Map<String, dynamic> data)
      : name = data['name'],
        value = data['value'];
}

class IngredientListDto {
  final int id;
  final List<dynamic> _items;

  late List<IngredientDto> items = [];

  IngredientListDto.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        _items = data['ingredients'] {
    items = _items.map((e) => IngredientDto.fromJson(id, e)).toList();
  }
}
