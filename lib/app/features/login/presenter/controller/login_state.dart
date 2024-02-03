// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_academy/app/features/login/presenter/models/user_hasura_model.dart';
import 'package:my_academy/app/features/login/presenter/models/user_model.dart';

class LoginState {
  final bool visibilitPass;
  final UserModelAuth userModelAuth;
  final bool isSucessCreateAccount;
  final UserHasuraModel? userHasuraModel;
  LoginState({
    required this.userHasuraModel,
    required this.visibilitPass,
    required this.userModelAuth,
    required this.isSucessCreateAccount,
  });

  factory LoginState.init() => LoginState(
        isSucessCreateAccount: false,
        userModelAuth: UserModelAuth(id: '', email: '', name: ''),
        visibilitPass: false,
        userHasuraModel: null,
      );

  LoginState copyWith({
    UserHasuraModel? userHasuraModel,
    bool? visibilitPass,
    UserModelAuth? userModelAuth,
    bool? isSucessCreateAccount,
  }) {
    return LoginState(
      isSucessCreateAccount:
          isSucessCreateAccount ?? this.isSucessCreateAccount,
      userModelAuth: userModelAuth ?? this.userModelAuth,
      visibilitPass: visibilitPass ?? this.visibilitPass,
      userHasuraModel: userHasuraModel ?? this.userHasuraModel,
    );
  }
}
