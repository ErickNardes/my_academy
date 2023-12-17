// ignore_for_file: use_build_context_synchronously

import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';
import 'package:my_academy/core/helpers/email_validate.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class CreateAccountWidget extends StatefulWidget {
  const CreateAccountWidget({super.key});

  @override
  State<CreateAccountWidget> createState() => _CreateAccountWidgetState();
}

class _CreateAccountWidgetState extends State<CreateAccountWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<LoginController>();
    final size = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded(
            //   child: Lottie.asset(
            //       'lib/assets/lottie/animation_create_account.json',
            //       repeat: false),
            // ),
            // SizedBox(
            //   height: size.height * 0.02,
            // ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo obrigatório!';
                return null;
              },
              controller: controller.createAccountNamecontroller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.white),
                fillColor: ThemeColors.prymaryGreenColor,
                focusColor: ThemeColors.prymaryGreenColor,
                hoverColor: ThemeColors.prymaryGreenColor,
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.abc_outlined,
                  color: ThemeColors.prymaryGreenColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      color: ThemeColors.prymaryGreenColor, width: 1.5),
                ),
                label: Text('Nome'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide:
                        BorderSide(color: ThemeColors.prymaryGreenColor)),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo obrigatório!';
                final isvalid = EmailValidator.validate(value);
                if (!isvalid) return 'informe um email válido';
                return null;
              },
              controller: controller.createAccountEmailcontroller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.white),
                fillColor: ThemeColors.prymaryGreenColor,
                focusColor: ThemeColors.prymaryGreenColor,
                hoverColor: ThemeColors.prymaryGreenColor,
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: ThemeColors.prymaryGreenColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      color: ThemeColors.prymaryGreenColor, width: 1.5),
                ),
                label: Text('Email'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide:
                        BorderSide(color: ThemeColors.prymaryGreenColor)),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo obrigatório!';
                return null;
              },
              controller: controller.createAccountPasswordcontroller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.white),
                fillColor: ThemeColors.prymaryGreenColor,
                focusColor: ThemeColors.prymaryGreenColor,
                hoverColor: ThemeColors.prymaryGreenColor,
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: ThemeColors.prymaryGreenColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      color: ThemeColors.prymaryGreenColor, width: 1.5),
                ),
                label: Text('Senha'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide:
                        BorderSide(color: ThemeColors.prymaryGreenColor)),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo obrigatório!';
                } else if (value !=
                    controller.createAccountPasswordcontroller.text) {
                  return 'Senhas devem ser iguais!';
                }
                return null;
              },
              controller: controller.createAccountConfirmePasswordcontroller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                errorStyle: TextStyle(color: Colors.white),
                fillColor: ThemeColors.prymaryGreenColor,
                focusColor: ThemeColors.prymaryGreenColor,
                hoverColor: ThemeColors.prymaryGreenColor,
                labelStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  Icons.password_outlined,
                  color: ThemeColors.prymaryGreenColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                      color: ThemeColors.prymaryGreenColor, width: 1.5),
                ),
                label: Text('Confirme sua Senha'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide:
                        BorderSide(color: ThemeColors.prymaryGreenColor)),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
                height: size.height * 0.05,
                width: size.width * 0.8,
                child: ValueListenableBuilder(
                    valueListenable: controller.selectState,
                    builder: (context, _, __) {
                      return controller.state.isSucessCreateAccount
                          ? const Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : InkWell(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  final createAccount = await controller
                                      .signUpWithEmailAndPassword();
                                  if (createAccount) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                          Text('Conta criada com Sucesso!!!'),
                                      backgroundColor:
                                          ThemeColors.prymaryGreenColor,
                                    ));
                                    Modular.to.pushNamed('home_page',
                                        arguments: {
                                          'loginController': controller
                                        });
                                  }
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ThemeColors.prymaryGreenColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: ThemeColors.prymaryGreenColor),
                                ),
                                child: Center(
                                  child: Text(
                                    'Cadastrar',
                                    style: TextStyle(
                                        fontFamily: 'Lato-Regular',
                                        color: ThemeColors.backgroudColor,
                                        fontSize: size.width * 0.05),
                                  ),
                                ),
                              ),
                            );
                    })),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
