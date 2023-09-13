import 'package:flutter/material.dart';

class User {
  final String _imgType;
  final String _imgPath;
  final String name;

  User(this._imgType, this._imgPath, this.name);

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
