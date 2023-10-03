import "dart:async";
import 'package:flutter/material.dart';

import 'package:otus_food/features/recipe/domain/repository/init.dart';
import 'package:otus_food/features/recipe/view/elements/error.dart';
import 'package:otus_food/features/recipe/view/recipe.dart';
import 'package:otus_food/features/recipe/domain/model/recipe.dart';

const borderRadius = 10.0;

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<StatefulWidget> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  late Future<List<Recipe>> _futureList;

  @override
  initState() {
    super.initState();
    _futureList = provider.recipes();
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
        future: _futureList,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return LoadDataError(reason: snapshot.error.toString());
          }

          if (!snapshot.hasData && !snapshot.hasError) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = snapshot.requireData;

          return ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, idx) {
              return _RecipesListEntry(data[idx]);
            },
            separatorBuilder: (context, idx) {
              return const SizedBox(height: 16);
            },
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RecipeView(item: item),
          ),
        );
      },
      child: Container(
        height: 136,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 208, 208, 208),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          color: Colors.white,
        ),
        clipBehavior: Clip.hardEdge,
        child: _RecipeEntry(item: item),
      ),
    );
  }
}

class _RecipeEntry extends StatelessWidget {
  final Recipe item;

  const _RecipeEntry({required this.item});

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      direction: Axis.horizontal,
      children: [
        Flexible(flex: 37, fit: FlexFit.tight, child: item.image(BoxFit.cover)),
        Flexible(
          flex: 63,
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
                          color: Color.fromARGB(255, 46, 204, 113),
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
    );
  }
}
