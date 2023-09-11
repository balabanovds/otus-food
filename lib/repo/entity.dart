import 'package:flutter/material.dart';

class Recipe {
  final int id;
  final String imgType;
  final String imgPath;
  final String title;
  final String duration;

  Recipe.fromJson(Map<String, dynamic> data)
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
