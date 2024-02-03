// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class CardPopularityWidget extends StatefulWidget {
  final ExerciceModel exerciceModel;
  final ExerciceController exerciceController;
  const CardPopularityWidget({
    Key? key,
    required this.exerciceModel,
    required this.exerciceController,
  }) : super(key: key);

  @override
  State<CardPopularityWidget> createState() => _CardPopularityWidgetState();
}

class _CardPopularityWidgetState extends State<CardPopularityWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        widget.exerciceController.setIsTtrainingDay(false);
        widget.exerciceController.selectExercice(widget.exerciceModel);
        Modular.to.pushNamed('/details_exercice_page');
      },
      child: Container(
        height: size.height * 0.02,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(44),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnpi31ao2PVXn1r52zTu2qx2tp8sgg0dSQEQ&usqp=CAU',
                fit: BoxFit.cover,
                width: size.width,
                height: size.height,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.exerciceModel.category,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Lato-Bold',
                        color: Colors.white,
                        fontSize: size.width * 0.06),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.exerciceModel.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Lato-Bold',
                          color: Colors.white,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Expanded(
                        child: CircleAvatar(
                          backgroundColor: ThemeColors.prymaryGreenColor,
                          child: Icon(Icons.play_arrow),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
