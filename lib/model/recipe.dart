import 'package:flutter/material.dart';

class Recipe {
  final int id;
  final String imgType;
  final String imgPath;
  final String title;
  final String duration;

  Recipe(this.id, this.imgType, this.imgPath, this.title, this.duration);

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
