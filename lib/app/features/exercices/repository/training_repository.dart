import 'package:fpdart/fpdart.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:my_academy/app/features/exercices/constants/strings.dart';
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';
import 'package:my_academy/app/features/exercices/params/get_list_exercice_day_params.dart';
import 'package:my_academy/app/features/exercices/params/insert_training_params.dart';
import 'package:my_academy/app/features/exercices/repository/i_training_repository.dart';

class TrainingRepository implements ITrainingRepository {
  final HasuraConnect hasuraConnect;
  const TrainingRepository(this.hasuraConnect);
  @override
  Future<Either<Exception, Unit>> insertTraining(
      InsertTrainingParams params) async {
    try {
      await hasuraConnect
          .mutation(HasuraExercicesQuery.insertTrainingUser, variables: {
        'objects': {
          'id_user': params.idUser,
          'id_exercice': params.idExercice,
          'day': params.day,
        }
      });
      return const Right(unit);
    } catch (e) {
      throw Exception('Erro ao adicionar treino! $e');
    }
  }

  @override
  Future<Either<Exception, List<ExerciceModel>>> getListTrainingWithDay(
      GetListExercicesDayParams params) async {
    try {
      final response = await hasuraConnect.query(
        HasuraExercicesQuery.getListExercicesDay,
        variables: {'day': params.day, 'idUser': params.idUser},
      );

      final List<dynamic> dataList =
          response['data']['day_training_users'] as List<dynamic>;

      final List<ExerciceModel> result = dataList
          .map((item) => ExerciceModel.fromMap(item['exercice']))
          .toList();

      return Right(result);
    } catch (e) {
      throw Exception('Erro ao buscar lista de treinos. $e');
    }
  }
}
