import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_academy/app/features/login/presenter/controller/login_state.dart';
import 'package:my_academy/app/features/login/presenter/controller/params/create_account_params.dart';
import 'package:my_academy/app/features/login/presenter/controller/params/insert_user_hasura_params.dart';
import 'package:my_academy/app/features/login/presenter/models/user_model.dart';
import 'package:my_academy/app/features/login/presenter/repository/i_get_user_with_firebase_id_repository.dart';
import 'package:my_academy/app/features/login/presenter/repository/i_insert_user_hasura_repository.dart';

final class LoginController extends Store<LoginState> {
  final IInsertUserHasuraRepository _insertUserHasuraRepository;
  final IGetUserWithFirebaseIdRepository _iGetUserWithFirebaseIdRepository;
  LoginController({
    required IGetUserWithFirebaseIdRepository iGetUserWithFirebaseIdRepository,
    required IInsertUserHasuraRepository iInsertUserHasuraRepository,
  })  : _iGetUserWithFirebaseIdRepository = iGetUserWithFirebaseIdRepository,
        _insertUserHasuraRepository = iInsertUserHasuraRepository,
        super(LoginState.init());
  final createAccountNamecontroller = TextEditingController();
  final createAccountEmailcontroller = TextEditingController();
  final createAccountPasswordcontroller = TextEditingController();
  final createAccountConfirmePasswordcontroller = TextEditingController();

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void setVisibilityPass() {
    update(state.copyWith(visibilitPass: !state.visibilitPass));
  }

  Future<void> insertUserHasura() async {
    final params = InsertUserHasuraParams(
      name: state.userModelAuth.name,
      email: state.userModelAuth.email,
      firebaseId: state.userModelAuth.id,
    );

    final result = await _insertUserHasuraRepository.insertUserHasura(params);
    result.fold((l) => setError, (r) => r);
  }

  Future<bool> signUpWithEmailAndPassword() async {
    update(state.copyWith(isSucessCreateAccount: true));
    final params = CreateAccountParams(
        name: createAccountNamecontroller.text,
        email: createAccountEmailcontroller.text,
        password: createAccountPasswordcontroller.text);

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(params.name);

        await _firestore.collection('Users').doc(user.uid).set({
          'name': params.name,
          'email': params.email,
        });
        update(state.copyWith(
            userModelAuth: UserModelAuth(
          id: user.uid,
          email: params.email,
          name: params.name,
        )));

        await insertUserHasura();

        final CollectionReference userCollection =
            FirebaseFirestore.instance.collection('Users');
        final userDocRef = userCollection.doc(user.uid);
        final CollectionReference treinosCollection =
            userDocRef.collection('treinos');
        for (int i = 0; i < 7; i++) {
          await treinosCollection.doc(i.toString()).set(Map<String, dynamic>());
        }
      }
      await getUserHasura();
      update(state.copyWith(isSucessCreateAccount: false));

      return true;
    } catch (e) {
      debugPrint('Erro durante o registro: $e');
      update(state.copyWith(isSucessCreateAccount: false));
      return false;
    }
  }

  Future<bool> signInWithEmailAndPassword() async {
    update(state.copyWith(isSucessCreateAccount: true));
    setLoading(true);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      );

      update(state.copyWith(
          userModelAuth: UserModelAuth(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: userCredential.user!.displayName!,
      )));
      await getUserHasura();
      update(state.copyWith(isSucessCreateAccount: false));
      setLoading(false);
      return true;
    } catch (e) {
      debugPrint('Erro durante o login: $e');
      setLoading(false);
      update(state.copyWith(isSucessCreateAccount: false));
      return false;
    }
  }

  Future<void> getUserHasura() async {
    final result =
        await _iGetUserWithFirebaseIdRepository.getUser(state.userModelAuth.id);
    result.fold((l) => setError, (r) {
      update(state.copyWith(userHasuraModel: r.first));
    });
  }
}
