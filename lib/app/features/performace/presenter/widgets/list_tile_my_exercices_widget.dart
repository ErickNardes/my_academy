// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';
import 'package:my_academy/app/features/exercices/params/get_list_exercice_day_params.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class ListTileMyExercicesWidget extends StatefulWidget {
  final ExerciceController controller;
  final ExerciceModel exerciceModel;
  final int index;
  final int idUser;
  const ListTileMyExercicesWidget({
    Key? key,
    required this.controller,
    required this.exerciceModel,
    required this.index,
    required this.idUser,
  }) : super(key: key);

  @override
  State<ListTileMyExercicesWidget> createState() =>
      _ListTileMyExercicesWidgetState();
}

class _ListTileMyExercicesWidgetState extends State<ListTileMyExercicesWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          InkWell(
            onTap: () async {
              widget.controller.selectMyExercice(widget.exerciceModel);
            },
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
          Visibility(
            visible: widget.controller.state.selectMyExercice != null,
            child: Positioned(
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
                        child: IconButton(
                            onPressed: () async {
                              await widget.controller.deleteExercice(
                                  widget.controller.state.selectMyExercice!.id,
                                  widget.controller
                                      .setDayWithExplore(widget.index));
                              await widget.controller.getListExercicesWithDay(
                                  GetListExercicesDayParams(
                                      day: widget.controller.state.dayString,
                                      idUser: widget.idUser));
                            },
                            icon: Icon(Icons.delete_outline))),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
