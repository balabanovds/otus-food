import '../dto/step.dart';
import '../../domain/model/step.dart';

class StepMapper {
  static Step fromAPI(StepDto item) {
    return Step(item.id, item.stepNumber, item.done, item.text, item.duration);
  }
}
