// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_academy/app/features/login/presenter/models/user_model.dart';

class LoginState {
  final String nameUser;
  final UserModelAuth userModelAuth;
  final bool isSucessCreateAccount;
  LoginState({
    required this.nameUser,
    required this.userModelAuth,
    required this.isSucessCreateAccount,
  });

  factory LoginState.init() => LoginState(
        isSucessCreateAccount: false,
        userModelAuth: UserModelAuth(id: '', email: '', name: ''),
        nameUser: '',
      );

  LoginState copyWith({
    String? nameUser,
    UserModelAuth? userModelAuth,
    bool? isSucessCreateAccount,
  }) {
    return LoginState(
      isSucessCreateAccount:
          isSucessCreateAccount ?? this.isSucessCreateAccount,
      userModelAuth: userModelAuth ?? this.userModelAuth,
      nameUser: nameUser ?? this.nameUser,
    );
  }
}
