// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class FormLoginWidget extends StatefulWidget {
  final LoginController controller;
  const FormLoginWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FormLoginWidget> createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState extends State<FormLoginWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginKey = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
      child: Form(
        key: loginKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: widget.controller.loginEmailController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Preencha o Email para proseguir';
                }
                return null;
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ValueListenableBuilder(
                valueListenable: widget.controller.selectState,
                builder: (context, _, __) {
                  return TextFormField(
                    controller: widget.controller.loginPasswordController,
                    style: const TextStyle(color: Colors.white),
                    obscureText: widget.controller.state.visibilitPass,
                    decoration: InputDecoration(
                      fillColor: ThemeColors.prymaryGreenColor,
                      focusColor: ThemeColors.prymaryGreenColor,
                      hoverColor: ThemeColors.prymaryGreenColor,
                      labelStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: ThemeColors.prymaryGreenColor,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            widget.controller.setVisibilityPass();
                          },
                          icon: Icon(
                            widget.controller.state.visibilitPass
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: widget.controller.state.visibilitPass
                                ? ThemeColors.prymaryGreenColor
                                : Colors.white,
                          )),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                            color: ThemeColors.prymaryGreenColor, width: 1.5),
                      ),
                      label: const Text('Senha'),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide:
                              BorderSide(color: ThemeColors.prymaryGreenColor)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo senha obrigatório';
                      }
                      return null;
                    },
                  );
                }),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              height: size.height * 0.05,
              width: size.width * 0.8,
              child: InkWell(
                  onTap: () async {
                    if (loginKey.currentState!.validate()) {
                      final loginSuccess =
                          await widget.controller.signInWithEmailAndPassword();
                      if (loginSuccess) {
                        Modular.to.navigate('/home_page', arguments: {
                          'loginController': widget.controller,
                        });
                      }
                    }
                  },
                  child: ScopedBuilder(
                    store: widget.controller,
                    onState: (context, state) {
                      return Container(
                        decoration: BoxDecoration(
                          color: ThemeColors.prymaryGreenColor,
                          borderRadius: BorderRadius.circular(12),
                          border:
                              Border.all(color: ThemeColors.prymaryGreenColor),
                        ),
                        child: Center(
                            child: ValueListenableBuilder(
                                valueListenable: widget.controller.selectState,
                                builder: (context, _, __) {
                                  return widget.controller.state
                                          .isSucessCreateAccount
                                      ? const CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                              ThemeColors.backgroudColor),
                                        )
                                      : Text(
                                          'Entrar',
                                          style: TextStyle(
                                              color: ThemeColors.backgroudColor,
                                              fontSize: size.width * 0.05),
                                        );
                                })),
                      );
                    },
                  )),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            InkWell(
              onTap: () {
                Modular.to.pushNamed('/create_account_page');
              },
              child: Container(
                width: size.width * 0.8,
                height: size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white),
                ),
                child: const Center(
                  child: Text(
                    'Cadastre-se',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
