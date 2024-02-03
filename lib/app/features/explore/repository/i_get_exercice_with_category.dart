import 'package:fpdart/fpdart.dart';
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';

abstract class IGetExerciceWithCategory {
  Future<Either<Exception, List<ExerciceModel>>> call(String category);
}
