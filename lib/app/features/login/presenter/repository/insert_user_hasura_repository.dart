import 'package:fpdart/fpdart.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:my_academy/app/features/login/presenter/controller/params/insert_user_hasura_params.dart';
import 'package:my_academy/app/features/login/presenter/controller/params/strings/hasura_string.dart';
import 'package:my_academy/app/features/login/presenter/repository/i_insert_user_hasura_repository.dart';

class InsertUserHasuraRepository implements IInsertUserHasuraRepository {
  final HasuraConnect hasuraConnect;
  const InsertUserHasuraRepository(this.hasuraConnect);

  @override
  Future<Either<Exception, Unit>> insertUserHasura(
      InsertUserHasuraParams params) async {
    try {
      await hasuraConnect
          .mutation(HasuraUserString.insertUserHasuraMutation, variables: {
        'objects': {
          'name': params.name,
          'email': params.email,
          'firebase_id': params.firebaseId,
        }
      });
      return const Right(unit);
    } catch (e) {
      throw 'Erro ao cadastrar usuário $e';
    }
  }
}
