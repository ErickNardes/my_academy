// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:intl/intl.dart';
import 'package:my_academy/app/features/performace/presenter/pages/perfomace_page.dart';
import 'package:redacted/redacted.dart';

import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';
import 'package:my_academy/app/features/exercices/params/get_list_exercice_day_params.dart';
import 'package:my_academy/app/features/exercices/presenter/widgets/card_popularity_widget.dart';
import 'package:my_academy/app/features/exercices/presenter/widgets/list_tile_training_day_widget.dart';
import 'package:my_academy/app/features/explore/presenter/controller/explore_controller.dart';
import 'package:my_academy/app/features/explore/presenter/pages/explore_pages.dart';
import 'package:my_academy/app/features/home/presenter/pages/home_page.dart';
import 'package:my_academy/app/features/home/presenter/widgets/custom_bottom_navbar_widget.dart';
import 'package:my_academy/app/features/home/presenter/widgets/custom_search_home_widget.dart';
import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class BasePage extends StatefulWidget {
  final LoginController loginController;
  final ExerciceController exerciceController;
  final ExploreController exploreController;
  const BasePage({
    Key? key,
    required this.loginController,
    required this.exerciceController,
    required this.exploreController,
  }) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  void initState() {
    super.initState();

    widget.exerciceController.getListExercices();
    final data = DateFormat('EEEE', 'pt_BR');
    final dataResult = data.format(DateTime.now());
    final params = GetListExercicesDayParams(
        day: dataResult,
        idUser: widget.loginController.state.userHasuraModel!.id);
    widget.exerciceController.getListExercicesWithDay(params);
    widget.exerciceController.setDayString(dataResult);
  }

  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[80],
      appBar: AppBar(
        backgroundColor: Colors.grey[80],
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Boa Noite',
                    style: TextStyle(
                      fontFamily: 'Lato-Bold',
                      fontSize: size.width * 0.06,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  SvgPicture.asset(
                    'lib/assets/icons/fire_icon.svg',
                    width: size.width * 0.06,
                  )
                ],
              ),
              SizedBox(
                height: size.width * 0.02,
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomePage(
              loginController: widget.loginController,
              exerciceController: widget.exerciceController),
          ExplorePage(
            exploreController: widget.exploreController,
          ),
          PerfomacePage(
            controller: widget.exerciceController,
          ),
          PerfomacePage(
            controller: widget.exerciceController,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            pageController.jumpToPage(index);
            pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: ThemeColors.backgroudColor,
        selectedItemColor: ThemeColors.prymaryGreenColor,
        unselectedItemColor: Colors.white.withAlpha(100),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Meu Treino',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
