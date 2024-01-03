import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_academy/core/config/firebase/intialize.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    InitializeFirebase.initalizeConfig();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        primaryColor: ThemeColors.prymaryGreenColor,
      ),
    );
  }
}
