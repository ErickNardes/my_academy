import 'package:fpdart/fpdart.dart';
import 'package:my_academy/app/features/login/presenter/models/user_hasura_model.dart';

abstract class IGetUserWithFirebaseIdRepository {
  Future<Either<Exception, List<UserHasuraModel>>> getUser(String firebaseId);
}
