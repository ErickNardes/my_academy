import 'package:flutter/material.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class AppNameWidget extends StatelessWidget {
  final Color? greenTileColor;
  final double textSize;

  const AppNameWidget({
    Key? key,
    this.greenTileColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: const [
          TextSpan(
            text: 'My',
            style: TextStyle(
              color: ThemeColors.prymaryGreenColor,
            ),
          ),
          TextSpan(
            text: 'Academy',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
