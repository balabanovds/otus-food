import 'package:flutter/material.dart';

class LoadDataError extends StatelessWidget {
  final String reason;

  const LoadDataError({super.key, required this.reason});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(reason));
  }
}
