import 'package:flutter/material.dart';
import 'package:otus_food/features/recipe/repo/dto.dart';
import 'package:otus_food/features/recipe/repo/provider.dart';
import 'package:otus_food/features/recipe/repo/provider_json.dart';
import 'package:otus_food/features/recipe/ui/recipe.dart';

class Steps extends StatefulWidget {
  final int id;

  const Steps({super.key, required this.id});

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  List<StepDto> _steps = [];

  @override
  void initState() {
    super.initState();
    loadData(JsonProvider());
  }

  Future<void> loadData(StepsProvider provider) async {
    var data = await provider.steps(widget.id);
    setState(() {
      _steps = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Шаги приготовления',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16,
            color: titleTextColor,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        _steps.isEmpty
            ? const CircularProgressIndicator()
            : Column(
                children: _steps.map((e) => Step(item: e)).toList(),
              )
      ],
    );
  }
}

class Step extends StatefulWidget {
  final StepDto item;

  const Step({super.key, required this.item});

  @override
  State<Step> createState() => _StepState();
}

class _StepState extends State<Step> {
  var _done = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 236, 236, 236),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            children: [
              const Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: Text(
                  '${widget.item.stepNumber}',
                  style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 194, 194, 194)),
                ),
              ),
              const Flexible(
                flex: 7,
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              Flexible(
                flex: 62,
                fit: FlexFit.tight,
                child: Text(
                  widget.item.text,
                  style: const TextStyle(
                      fontSize: 12,
                      height: 1.5,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 121, 118, 118)),
                ),
              ),
              const Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              Flexible(
                flex: 8,
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _done = !_done;
                        });
                      },
                      padding: const EdgeInsets.all(0),
                      alignment: Alignment.center,
                      iconSize: 30,
                      color: const Color.fromARGB(255, 121, 118, 118),
                      icon: _done ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      widget.item.duration,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 121, 118, 118),
                      ),
                    )
                  ],
                ),
              ),
              const Flexible(
                flex: 6,
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 14,
        )
      ],
    );
  }
}
