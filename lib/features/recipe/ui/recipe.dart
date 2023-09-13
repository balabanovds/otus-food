import 'package:flutter/material.dart';
import 'package:otus_food/features/recipe/ui/comments.dart';

import '../domain/model/recipe.dart';
import 'steps.dart';
import 'ingredients.dart';

const Color titleTextColor = Color.fromARGB(255, 22, 89, 50);

// class RecipePage extends StatelessWidget {
//   const RecipePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const CustomScrollView(
//       slivers: [SliverList(delegate: Sliver())],
//     );
//   }
// }

class RecipeView extends StatefulWidget {
  final Recipe item;

  const RecipeView({super.key, required this.item});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: titleTextColor,
        ),
        title: const Text(
          'Рецепт',
          style: TextStyle(
            color: titleTextColor,
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
        padding: const EdgeInsets.only(
          top: 38,
          left: 15,
          right: 15,
        ),
        child: ListView(
          children: [
            _RecipeViewTitle(item: widget.item),
            const SizedBox(
              height: 12,
            ),
            _RecipeViewImage(item: widget.item),
            const SizedBox(
              height: 22,
            ),
            Ingredients(id: widget.item.id),
            const SizedBox(
              height: 20,
            ),
            StepsView(id: widget.item.id),
            const Divider(color: Color.fromARGB(255, 121, 118, 118)),
            CommentsView(id: widget.item.id),
          ],
        ),
      ),
    );
  }
}

class _RecipeViewTitle extends StatefulWidget {
  final Recipe item;

  const _RecipeViewTitle({required this.item});

  @override
  State<_RecipeViewTitle> createState() => _RecipeViewTitleState();
}

class _RecipeViewTitleState extends State<_RecipeViewTitle> {
  var _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 80,
              fit: FlexFit.tight,
              child: Text(
                widget.item.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Flexible(
              flex: 20,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
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
              ),
            )
          ],
        ),
        const SizedBox(height: 5),
        Row(
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
              widget.item.duration,
              style: const TextStyle(
                color: Color.fromARGB(255, 46, 204, 113),
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RecipeViewImage extends StatelessWidget {
  final Recipe item;

  const _RecipeViewImage({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          Positioned.fill(
            top: -120,
            child: item.image(BoxFit.cover),
          )
        ],
      ),
    );
  }
}
