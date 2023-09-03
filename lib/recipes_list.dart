import 'dart:convert';
import "dart:async";

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otus_food/relative_size.dart';

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<StatefulWidget> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  List _list = [];

  @override
  initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final String response = await rootBundle.loadString('assets/recipes.json');
    final data = await json.decode(response);
    setState(() {
      _list = data['items'];
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
          ? Expanded(
              child: ListView.separated(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  final _RecipeDto item = _RecipeDto.fromJson(_list[index]);
                  return _RecipesListEntry(
                      item._url, item._title, item._duration);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: RelativeSize.height(context, 24),
                  );
                },
              ),
            )
          : Container(),
    );
  }
}

class _RecipeDto {
  final int _id;
  final String _url;
  final String _title;
  final String _duration;

  _RecipeDto.fromJson(Map<String, dynamic> data)
      : _id = data['id'],
        _url = data['url'],
        _title = data['title'],
        _duration = data['duration'];
}

class _RecipesListEntry extends StatelessWidget {
  final String _url;
  final String _title;
  final String _duration;

  const _RecipesListEntry(this._url, this._title, this._duration);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
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
        SizedBox(
          width: RelativeSize.width(context, 149),
          height: RelativeSize.height(context, 136),
          child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              _url,
            ),
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
                  _title,
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
                      _duration,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 46, 204, 113),
                        fontFamily: 'Roboto',
                        fontSize: RelativeSize.height(context, 16),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Expanded(
                    //     child: Text(
                    //   duration,
                    // ))
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
