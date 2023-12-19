import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';
import 'package:my_academy/app/features/exercices/controller/exercice_state.dart';
import 'package:my_academy/app/features/exercices/repository/get_list_exercice_repository.dart';
import 'package:my_academy/app/features/exercices/repository/i_get_list_exercice_repository.dart';
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
    i.addLazySingleton<IGetListExerciceRepository>(
        GetListExerciceRepository.new);
    i.addLazySingleton(ExerciceController.new);
    i.addLazySingleton(ExerciceState.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.child('/welcome_page', child: (context) => const WelcomePage());

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
