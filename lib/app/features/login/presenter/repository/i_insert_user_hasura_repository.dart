import 'package:fpdart/fpdart.dart';
import 'package:my_academy/app/features/login/presenter/controller/params/insert_user_hasura_params.dart';

abstract class IInsertUserHasuraRepository {
  Future<Either<Exception, Unit>> insertUserHasura(
      InsertUserHasuraParams params);
}
