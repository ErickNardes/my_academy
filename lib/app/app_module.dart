import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';
import 'package:my_academy/app/features/exercices/controller/exercice_state.dart';
import 'package:my_academy/app/features/exercices/presenter/pages/details_exercice_page.dart';
import 'package:my_academy/app/features/exercices/repository/get_list_top_exercice_repository.dart';
import 'package:my_academy/app/features/exercices/repository/i_get_list_top_exercice_repository.dart';
import 'package:my_academy/app/features/exercices/repository/i_training_repository.dart';
import 'package:my_academy/app/features/exercices/repository/training_repository.dart';
import 'package:my_academy/app/features/home/presenter/controller/home_controller.dart';
import 'package:my_academy/app/features/home/presenter/pages/home_page.dart';
import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';
import 'package:my_academy/app/features/login/presenter/controller/login_state.dart';
import 'package:my_academy/app/features/login/presenter/pages/create_account_page.dart';
import 'package:my_academy/app/features/login/presenter/pages/login_page.dart';
import 'package:my_academy/app/features/splash/pages/splash_page.dart';
import 'package:my_academy/app/features/welcome/presenter/pages/welcome_page.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    //login
    i.addLazySingleton(LoginController.new);
    i.addLazySingleton(LoginState.new);

    //home
    i.addLazySingleton(HomeController.new);

    //exercices
    i.addLazySingleton<ITrainingRepository>(TrainingRepository.new);
    i.addInstance(
        HasuraConnect('https://myacademy.hasura.app/v1/graphql', headers: {
      'content-type': 'application/json',
      'x-hasura-admin-secret':
          'aUW415r31gVBdwmr43cEw7An2OEtBbtGTDs4TY3xdHXIE7zWHY9DSlJQy3Z6lL8v'
    }));
    i.addLazySingleton<IGetListExerciceRepository>(
        GetListExerciceRepository.new);
    i.addLazySingleton(ExerciceController.new);
    i.addLazySingleton(ExerciceState.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.child('/welcome_page', child: (context) => const WelcomePage());
    r.child('/details_exercice_page',
        child: (context) => DetailsExercicePage(
            exerciceController: Modular.get<ExerciceController>()));

    r.child('/login_page',
        child: (context) => LoginPage(
              controller: Modular.get<LoginController>(),
            ));
    r.child('/create_account_page',
        child: (context) => const CreateAccountPage());
    r.child('/home_page',
        child: (context) => HomePage(
              loginController: Modular.get<LoginController>(),
              exerciceController: Modular.get<ExerciceController>(),
            ));
  }
}
