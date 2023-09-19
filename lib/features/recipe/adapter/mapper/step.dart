import 'package:otus_food/features/recipe/adapter/dto/recipe_step.dart';
import 'package:otus_food/features/recipe/domain/model/step.dart';

class StepMapper {
  static Step fromAPI(
    RecipeStepDto s,
  ) {
    final sl = s.recipeStepLinks[0];
    return Step(s.id, sl.number, s.name, Duration(seconds: s.duration));
  }
}
