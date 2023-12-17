// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';
import 'package:my_academy/app/features/login/presenter/widgets/app_name_widget.dart';
import 'package:my_academy/app/features/login/presenter/widgets/form_login_widget.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class LoginPage extends StatefulWidget {
  final LoginController controller;
  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroudColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const AppNameWidget(
            textSize: 44,
          ),
          const SizedBox(
            height: 20,
          ),
          FormLoginWidget(
            controller: widget.controller,
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
