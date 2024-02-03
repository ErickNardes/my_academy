// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_academy/app/features/exercices/model/exercice_model.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class ListTileTrainingDayWidget extends StatefulWidget {
  final ExerciceModel exerciceModel;
  final Function() onTap;
  const ListTileTrainingDayWidget({
    Key? key,
    required this.exerciceModel,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ListTileTrainingDayWidget> createState() =>
      _ListTileTrainingDayWidgetState();
}

class _ListTileTrainingDayWidgetState extends State<ListTileTrainingDayWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          InkWell(
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              height: size.height * 0.09,
              child: Row(
                children: [
                  Image.network(widget.exerciceModel.image),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.exerciceModel.name,
                        style: const TextStyle(
                          fontFamily: 'Lato-Bold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 1,
              right: 10,
              child: Container(
                decoration: const BoxDecoration(
                    color: ThemeColors.prymaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      widget.exerciceModel.difficulty,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
