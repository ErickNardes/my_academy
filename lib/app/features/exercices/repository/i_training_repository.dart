import 'package:fpdart/fpdart.dart';
import 'package:my_academy/app/features/exercices/params/get_list_exercice_day_params.dart';
import 'package:my_academy/app/features/exercices/params/insert_training_params.dart';

import '../model/exercice_model.dart';

abstract class ITrainingRepository {
  Future<Either<Exception, Unit>> insertTraining(InsertTrainingParams params);
  Future<Either<Exception, List<ExerciceModel>>> getListTrainingWithDay(
      GetListExercicesDayParams params);
}
