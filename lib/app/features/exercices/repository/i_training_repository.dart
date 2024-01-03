import 'package:my_academy/app/features/exercices/model/training_model.dart';

import '../model/exercice_model.dart';

abstract class ITrainingRepository {
  Future<void> insertTraining(TrainingModel params);
  // Future<List<ExerciceModel>> getListTrainingWithDay(int indexDay);
}
