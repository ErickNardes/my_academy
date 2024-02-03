import 'package:fpdart/src/either.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:my_academy/app/features/login/presenter/controller/params/strings/hasura_string.dart';
import 'package:my_academy/app/features/login/presenter/models/user_hasura_model.dart';
import 'package:my_academy/app/features/login/presenter/repository/i_get_user_with_firebase_id_repository.dart';

class GetUserWithFirebaseIdRepository
    implements IGetUserWithFirebaseIdRepository {
  final HasuraConnect hasuraConnect;

  const GetUserWithFirebaseIdRepository(this.hasuraConnect);
  @override
  Future<Either<Exception, List<UserHasuraModel>>> getUser(
      String firebaseId) async {
    try {
      final hasuraResponse = await hasuraConnect.query(
          HasuraUserString.getUserWithFirebaseId,
          variables: {'firebaseId': firebaseId});
      final response = List.from(hasuraResponse['data']['users']);
      final result = response.map((e) => UserHasuraModel.fromMap(e)).toList();
      return Right(result);
    } catch (e) {
      throw 'Erro ao buscar Usuário! $e';
    }
  }
}
