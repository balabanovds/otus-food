import "dart:async";

import 'package:flutter/material.dart';
import 'package:otus_food/colors.dart';
import 'package:otus_food/main.dart';
import 'package:otus_food/model/recipe.dart';

const _borderRadius = 10.0;

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<StatefulWidget> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  late Future<List<Recipe>> futureList;

  @override
  initState() {
    super.initState();
    futureList = recipesProvider.recipes();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 45,
        left: 16,
        right: 16,
      ),
      child: FutureBuilder(
        future: futureList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SnackBar(content: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData && !snapshot.hasError) {
            return const CircularProgressIndicator();
          }

          final list = snapshot.requireData;

          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return _RecipesListEntry(list[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 16,
              );
            },
            clipBehavior: Clip.none,
          );
        },
      ),
    );
  }
}

class _RecipesListEntry extends StatelessWidget {
  final Recipe item;

  const _RecipesListEntry(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      clipBehavior: Clip.hardEdge,
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            //   fit: BoxFit.cover,
            child: item.image(BoxFit.cover),
          ),
          Flexible(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 16,
                right: 16,
                bottom: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 11,
                        ),
                        Text(
                          item.duration,
                          style: const TextStyle(
                            color: textColorDuration,
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
