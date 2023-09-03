import 'dart:convert';
import "dart:async";

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      padding: const EdgeInsets.all(16),
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  );
                },
              ),
            )
          : Container(),
    );
  }
}

class _RecipeDto {
  final String _url;
  final String _title;
  final String _duration;

  _RecipeDto(this._url, this._title, this._duration);

  _RecipeDto.fromJson(Map<String, dynamic> data)
      : _url = data['url'],
        _title = data['title'],
        _duration = data['duration'];
}

class _RecipesListEntry extends StatelessWidget {
  final String url;
  final String title;
  final String duration;

  const _RecipesListEntry(this.url, this.title, this.duration);

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
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.33,
            height: MediaQuery.of(context).size.height * 0.14,
            child: FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                url,
              ),
            ))
      ],
    );
  }
}
