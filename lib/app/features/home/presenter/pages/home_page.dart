import 'package:flutter/material.dart';

import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';

class HomePage extends StatefulWidget {
  final LoginController loginController;
  const HomePage({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.loginController.state.userModelAuth.name,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body:
          Center(child: Text(widget.loginController.state.userModelAuth.name)),
    );
  }
}
