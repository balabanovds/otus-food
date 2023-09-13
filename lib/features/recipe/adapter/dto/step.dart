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

class StepListDto {
  final int id;
  final List<dynamic> _items;

  late List<StepDto> items = [];

  StepListDto.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        _items = data['steps'] {
    items = _items.map((e) => StepDto.fromJson(id, e)).toList();
  }
}
