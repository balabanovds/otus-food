import 'package:flutter/material.dart';

import 'recipe.dart';
import '../domain/repository/provider.dart';
import '../domain/model/step.dart' as model;

class StepsView extends StatefulWidget {
  final int id;

  const StepsView({super.key, required this.id});

  @override
  State<StepsView> createState() => _StepsViewState();
}

class _StepsViewState extends State<StepsView> {
  List<model.Step> _steps = [];

  @override
  void initState() {
    super.initState();
    loadData(provider);
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
      // crossAxisAlignment: _steps.isEmpty ? CrossAxisAlignment.center : CrossAxisAlignment.stretch,
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
                children: _steps.map((e) => StepView(item: e)).toList(),
              ),
        const SizedBox(
          height: 27,
        ),
        SizedBox(
          height: 48,
          width: 232,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: const StadiumBorder(),
              side: const BorderSide(width: 2, color: Color.fromARGB(255, 22, 89, 50)),
              backgroundColor: const Color.fromARGB(255, 22, 89, 50),
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            child: const Text(
              'Начать готовить',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        )
      ],
    );
  }
}

class StepView extends StatefulWidget {
  final model.Step item;

  const StepView({super.key, required this.item});

  @override
  State<StepView> createState() => _StepViewState();
}

class _StepViewState extends State<StepView> {
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
                flex: 4,
                fit: FlexFit.tight,
                child: SizedBox(),
              ),
              Flexible(
                flex: 10,
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
