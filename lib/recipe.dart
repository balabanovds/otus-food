import 'package:flutter/material.dart';
import 'package:otus_food/repo/dto.dart';

class Recipe extends StatefulWidget {
  final RecipeDto item;

  const Recipe({super.key, required this.item});

  @override
  State<Recipe> createState() => _RecipeState();
}

class _RecipeState extends State<Recipe> {
  final Color _appBarTextColor = const Color.fromARGB(255, 22, 89, 50);
  var _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: _appBarTextColor,
        ),
        title: Text(
          'Рецепт',
          style: TextStyle(
            color: _appBarTextColor,
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.campaign)),
        ],
        elevation: 5,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 38,
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.item.title,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 30,
                      color: _isFavorite ? Colors.red : Colors.black,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5),
            Row()
          ],
        ),
      ),
    );
  }
}
