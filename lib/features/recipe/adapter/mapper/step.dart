import 'package:otus_food/features/recipe/adapter/dto/step.dart';
import 'package:otus_food/features/recipe/domain/model/step.dart';

class StepMapper {
  static Step fromAPI(StepDto item) {
    return Step(item.id, item.stepNumber, item.done, item.text, item.duration);
  }
}
