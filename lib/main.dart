import 'package:flutter/material.dart';
import 'package:otus_food/colors.dart';
import 'package:otus_food/recipes_list.dart';
import 'package:otus_food/repo/provider.dart';
import 'package:otus_food/repo/provider_json.dart';

final RecipesProvider recipesProvider = JsonRecipesProvider();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      body: RecipesList(),
    );
  }
}
