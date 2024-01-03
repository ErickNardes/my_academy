import 'package:firebase_core/firebase_core.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:my_academy/firebase_options.dart';

class InitializeFirebase {
  static void initalizeConfig() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
