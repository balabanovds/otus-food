import 'package:flutter/material.dart';

import 'package:otus_food/features/recipe/domain/repository/init.dart';
import 'package:otus_food/features/recipe/domain/model/ingredient.dart';
import 'package:otus_food/features/recipe/view/elements/error.dart';
import 'package:otus_food/features/recipe/view/recipe.dart';

class Ingredients extends StatefulWidget {
  final int id;
  const Ingredients({super.key, required this.id});

  @override
  State<Ingredients> createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  late Future<List<Ingredient>> _futureIngredients;

  @override
  void initState() {
    super.initState();
    _futureIngredients = provider.ingredients(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Ингредиенты',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              color: titleTextColor,
            ),
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
          child: FutureBuilder(
            future: _futureIngredients,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return LoadDataError(reason: snapshot.error.toString());
              }

              if (!snapshot.hasData && !snapshot.hasError) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Column(
                children: snapshot.requireData
                    .map((e) => _IngredientRow(item: e))
                    .toList(),
              );
            },
          ),
        ),
        const SizedBox(height: 19),
        SizedBox(
          height: 48,
          width: 232,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: const StadiumBorder(),
              side: const BorderSide(
                  width: 2, color: Color.fromARGB(255, 22, 89, 50)),
              backgroundColor: Colors.white,
            ),
            onPressed: () {},
            child: const Text(
              'Проверить наличие',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 22, 89, 50),
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}

class _IngredientRow extends StatelessWidget {
  final Ingredient item;

  const _IngredientRow({required this.item});

  @override
  Widget build(BuildContext context) {
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
