import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class CustomNavBarWidget extends StatefulWidget {
  const CustomNavBarWidget({super.key});

  @override
  State<CustomNavBarWidget> createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.15,
      child: GNav(
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
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.rocket_launch_outlined,
              text: 'Explore',
            ),
            GButton(
              icon: Icons.poll_outlined,
              text: 'Performace',
            ),
            GButton(
              icon: Icons.person_2_outlined,
              text: 'Profile',
            )
          ]),
    );
  }
}
