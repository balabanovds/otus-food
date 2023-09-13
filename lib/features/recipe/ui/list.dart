import "dart:async";

import 'package:flutter/material.dart';
import 'package:otus_food/features/recipe/ui/recipe.dart';

import '../domain/repository/provider.dart';
import '../domain/model/recipe.dart';

const borderRadius = 10.0;

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<StatefulWidget> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  late List<Recipe> _list = [];

  @override
  initState() {
    super.initState();
    loadData(provider);
  }

  Future<void> loadData(RecipeListProvider provider) async {
    var data = await provider.recipes();
    setState(() {
      _list = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 45,
        left: 16,
        right: 16,
      ),
      child: _list.isNotEmpty
          ? ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return _RecipesListEntry(_list[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              clipBehavior: Clip.none,
            )
          : Container(),
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
