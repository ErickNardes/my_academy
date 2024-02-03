import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:my_academy/firebase_options.dart';

class InitializeFirebase {
  static void initalizeConfig() async {
    initializeDateFormatting('pt_BR', null);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
