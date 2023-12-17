import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/assets/images/image_welcome.png',
            width: size.width,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.7),
                Colors.white.withOpacity(0.6),
              ],
            )),
            child: Column(
              children: [
                const Text(
                  'Onde quer que você esteja\n a saúde está em primeiro lugar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Lato-Bold',
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  'Não existe um caminho instantâneo\n para uma vida saudável',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Lato-Regular',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          InkWell(
            onTap: () {
              Modular.to.navigate('login_page');
            },
            child: Container(
              width: size.width * 0.9,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                color: ThemeColors.backgroudColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: ThemeColors.backgroudColor),
              ),
              child: Center(
                child: Text(
                  'Iniciar',
                  style: TextStyle(
                      color: Colors.white, fontSize: size.width * 0.05),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
