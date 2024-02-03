// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';
import 'package:my_academy/app/features/exercices/presenter/pages/list_my_exercices_page.dart';
import 'package:my_academy/app/features/explore/presenter/controller/explore_controller.dart';
import 'package:my_academy/app/features/home/presenter/pages/base_page.dart';
import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class CustomNavBarWidget extends StatefulWidget {
  final LoginController loginController;
  final ExerciceController exerciceController;
  final ExploreController exploreController;
  const CustomNavBarWidget({
    Key? key,
    required this.loginController,
    required this.exerciceController,
    required this.exploreController,
  }) : super(key: key);

  @override
  State<CustomNavBarWidget> createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<ExerciceController>();
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.15,
      child: GNav(
          selectedIndex: widget.exerciceController.state.indexPage,
          backgroundColor: ThemeColors.prymaryColor,
          haptic: true, // haptic feedback
          tabBorderRadius: 50,
          curve: Curves.easeIn, // tab animation curves
          duration: const Duration(milliseconds: 900), // tab animation duration
          gap: 8, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: ThemeColors.prymaryColor, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor:
              ThemeColors.prymaryGreenColor, // selected tab background color
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 5), // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BasePage(
                    exploreController: widget.exploreController,
                    loginController: widget.loginController,
                    exerciceController: controller,
                  );
                }));
              },
            ),
            GButton(
              icon: Icons.rocket_launch_outlined,
              text: 'Explore',
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return FormPage();
                // }));
              },
            ),
            GButton(
              icon: Icons.poll_outlined,
              text: 'Performace',
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return ListMyExercicesPage(
                //     loginController: widget.loginController,
                //   );
                // }));
              },
            ),
            const GButton(
              icon: Icons.person_2_outlined,
              text: 'Profile',
            )
          ]),
    );
  }
}
