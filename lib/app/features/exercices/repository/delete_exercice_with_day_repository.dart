import 'package:fpdart/fpdart.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:my_academy/app/features/exercices/constants/strings.dart';
import 'package:my_academy/app/features/exercices/repository/i_delete_exercice_with_day_repository.dart';

class DeleteExerciceWithDayRepository
    implements IDeleteExerciceWithDayRepository {
  final HasuraConnect hasuraConnect;
  const DeleteExerciceWithDayRepository(this.hasuraConnect);

  @override
  Future<Either<Exception, Unit>> deleteExercice(
      {required int id, required String day}) async {
    try {
      final result = -await hasuraConnect.mutation(
          HasuraExercicesQuery.deleteExerciceWithDay,
          variables: {'id': id, 'day': day});
      return Right(result);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
