import 'package:flutter/material.dart';

class Recipe {
  final int id;
  final String _imgType;
  final String _imgPath;
  final String title;
  final String duration;

  Recipe(this.id, this._imgType, this._imgPath, this.title, this.duration);

  Image image(BoxFit fit) {
    switch (_imgType) {
      case "asset":
        return Image.asset(
          _imgPath,
          fit: fit,
        );
      case "network":
        return Image.network(
          _imgPath,
          fit: fit,
        );
      default:
    }
    throw Exception("unknown type");
  }
}
