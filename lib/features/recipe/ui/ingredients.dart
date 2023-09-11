import 'package:flutter/material.dart';
import 'package:otus_food/features/recipe/repo/dto.dart';
import 'package:otus_food/features/recipe/repo/provider.dart';
import 'package:otus_food/features/recipe/repo/provider_json.dart';
import 'package:otus_food/features/recipe/ui/recipe.dart';

class Ingredients extends StatefulWidget {
  final int id;
  const Ingredients({super.key, required this.id});

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  List<IngredientDto> _ingredients = [];

  @override
  void initState() {
    super.initState();
    loadData(JsonProvider());
  }

  Future<void> loadData(IngredientsProvider provider) async {
    var data = await provider.ingredients(widget.id);
    setState(() {
      _ingredients = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Ингредиенты',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            color: titleTextColor,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 18,
            left: 8,
            right: 8,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: const Color.fromARGB(255, 121, 118, 118),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: _ingredients.isNotEmpty
              ? Column(
                  children: _ingredients.map((e) => _row(e)).toList(),
                )
              : const CircularProgressIndicator(),
        )
      ],
    );
  }

  Widget _row(IngredientDto item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 70,
          child: Text(
            item.name,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 1.93,
            ),
          ),
        ),
        Flexible(
          flex: 30,
          child: Text(
            item.value,
            style: const TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Color.fromARGB(255, 121, 118, 118)),
          ),
        )
      ],
    );
  }
}
