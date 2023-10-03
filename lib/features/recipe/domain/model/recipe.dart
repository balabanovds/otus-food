import 'package:flutter/material.dart';

class Recipe {
  final int id;
  final String _imgType;
  final String _imgPath;
  final String title;
  final Duration _duration;
  final List<int> userIDFavorites;

  Recipe(this.id, this._imgType, this._imgPath, this.title, this._duration, this.userIDFavorites);

  String get duration => _printHoursMinutes(_duration);

  String _printHoursMinutes(Duration d) {
    var buf = StringBuffer();

    final int hours = d.inHours.remainder(24);

    if (hours > 0) {
      if (hours == 1) {
        buf.write('$hours час');
      } else if (hours < 5) {
        buf.write('$hours часа');
      } else {
        buf.write('$hours часов');
      }

      buf.write(' ');
    }

    final int minutes = d.inMinutes.remainder(60);

    if (minutes > 0) {
      if (minutes == 1) {
        buf.write('$minutes минута');
      } else if (minutes < 5) {
        buf.write('$minutes минуты');
      } else {
        buf.write('$minutes минут');
      }
    }

    return buf.toString();
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
