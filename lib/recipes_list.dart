import "dart:async";

import 'package:flutter/material.dart';
import 'package:otus_food/relative_size.dart';
import 'package:otus_food/repo/dto.dart';
import 'package:otus_food/repo/provider_json.dart';

const borderRadius = 10.0;

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<StatefulWidget> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  late List<RecipeDto> _list = [];

  @override
  initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    var data = await JsonRecipesProvider().recipes();
    setState(() {
      _list = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: RelativeSize.height(context, 45),
        left: RelativeSize.width(context, 16),
        right: RelativeSize.width(context, 16),
      ),
      child: _list.isNotEmpty
          ? ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return _RecipesListEntry(_list[index]);
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: RelativeSize.height(context, 24),
                );
              },
              clipBehavior: Clip.none,
            )
          : Container(),
    );
  }
}

class _RecipesListEntry extends StatelessWidget {
  final RecipeDto item;

  const _RecipesListEntry(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: RelativeSize.width(context, 396),
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
      child: _row(context),
    );
  }

  Widget _row(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            bottomLeft: Radius.circular(borderRadius),
          ),
          child: Image.network(
            item.url,
            fit: BoxFit.cover,
            width: RelativeSize.width(context, 149),
            height: RelativeSize.height(context, 136),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: RelativeSize.height(context, 30),
            left: RelativeSize.width(context, 16),
            right: RelativeSize.width(context, 23),
            bottom: RelativeSize.height(context, 23),
          ),
          child: Column(
            children: [
              SizedBox(
                height: RelativeSize.height(context, 52),
                width: RelativeSize.width(context, 208),
                child: Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: RelativeSize.height(context, 22),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: RelativeSize.height(context, 12),
              ),
              Container(
                height: RelativeSize.height(context, 19),
                width: RelativeSize.width(context, 208),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.schedule,
                      size: RelativeSize.height(context, 16),
                    ),
                    SizedBox(
                      width: RelativeSize.width(context, 11),
                    ),
                    Text(
                      item.duration,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 46, 204, 113),
                        fontFamily: 'Roboto',
                        fontSize: RelativeSize.height(context, 16),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
