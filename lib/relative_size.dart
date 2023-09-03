import 'package:flutter/material.dart';

// View port sizes taken from Figma.
const _vpheight = 926.0;
const _vpwidth = 428.0;

class RelativeSize {
  static double height(BuildContext context, double height) =>
      MediaQuery.of(context).size.height * (height / _vpheight);

  static double width(BuildContext context, double width) =>
      MediaQuery.of(context).size.width * (width / _vpwidth);
}
