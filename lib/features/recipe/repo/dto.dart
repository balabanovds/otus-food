import 'package:flutter/material.dart';

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

  Image image(BoxFit fit) {
    switch (imgType) {
      case "asset":
        return Image.asset(
          imgPath,
          fit: fit,
        );
      case "network":
        return Image.network(
          imgPath,
          fit: fit,
        );
      default:
    }
    throw Exception("unknown type");
  }
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
