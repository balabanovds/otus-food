import 'user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Comment {
  final int id;
  final int recipeID;
  final User user;
  final DateTime _createdAt;
  final String text;
  final String _imgType;
  final String _imgPath;

  Comment(this.id, this.recipeID, this.user, this._createdAt, this.text, this._imgType, this._imgPath);

  String get createdAt {
    final DateFormat formatter = DateFormat('dd.MM.yyyy');
    return formatter.format(_createdAt);
  }

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
