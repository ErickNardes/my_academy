// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_academy/app/features/exercices/model/exercice_model.dart';

class CardPopularityWidget extends StatefulWidget {
  final ExerciceModel exerciceModel;
  const CardPopularityWidget({
    Key? key,
    required this.exerciceModel,
  }) : super(key: key);

  @override
  State<CardPopularityWidget> createState() => _CardPopularityWidgetState();
}

class _CardPopularityWidgetState extends State<CardPopularityWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * 0.09,
      // width: size.width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Stack(
        children: [
          Image.network(
            widget.exerciceModel.imageThumb,
            height: 300,
          ),
        ],
      ),
    );
  }
}
