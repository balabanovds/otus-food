import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Bookmark extends StatelessWidget {
  final int count;

  const Bookmark({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23,
      width: 66,
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/img/common/bookmark.svg',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 7,
            bottom: 4,
            child: Text(
              '$count',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
