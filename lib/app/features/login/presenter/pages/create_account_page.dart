import 'package:flutter/material.dart';
import 'package:my_academy/app/features/login/presenter/widgets/form_create_account_widget.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.backgroudColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ThemeColors.backgroudColor,
        title: const Text(
          'Criar Conta',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: const CreateAccountWidget(),
    );
  }
}
