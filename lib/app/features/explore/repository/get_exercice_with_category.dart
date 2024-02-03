import 'package:fpdart/src/either.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';
import 'package:my_academy/app/features/explore/presenter/helpers/strings/explore_strings.dart';
import 'package:my_academy/app/features/explore/repository/i_get_exercice_with_category.dart';

class GetExerciceWithCategoryRepository implements IGetExerciceWithCategory {
  final HasuraConnect hasuraConnect;

  const GetExerciceWithCategoryRepository(this.hasuraConnect);

  @override
  Future<Either<Exception, List<ExerciceModel>>> call(String category) async {
    try {
      final response = await hasuraConnect.query(
          ExploreStrings.getExerciceWithCategory,
          variables: {'category': category});
      final data = List.from(response['data']['exercices']);
      final result = data.map((e) => ExerciceModel.fromMap(e)).toList();
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
