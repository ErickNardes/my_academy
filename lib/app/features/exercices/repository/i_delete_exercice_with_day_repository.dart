import 'package:fpdart/fpdart.dart';

abstract class IDeleteExerciceWithDayRepository {
  Future<Either<Exception, Unit>> deleteExercice(
      {required int id, required String day});
}
