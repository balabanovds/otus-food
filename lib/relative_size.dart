import 'package:flutter/material.dart';

class RelativeSize {
  // View port sizes taken from figma.
  static double _vpheight = 926;
  static double _vpwidth = 428;

  static double height(BuildContext context, double height) =>
      MediaQuery.of(context).size.height * (height / RelativeSize._vpheight);

  static double width(BuildContext context, double width) =>
      MediaQuery.of(context).size.width * (width / RelativeSize._vpwidth);
}
