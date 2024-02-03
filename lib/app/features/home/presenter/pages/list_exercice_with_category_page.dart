// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';
import 'package:my_academy/app/features/exercices/presenter/widgets/list_tile_training_day_widget.dart';
import 'package:my_academy/app/features/explore/presenter/controller/explore_controller.dart';

class ListExerciceWithCategoryPage extends StatefulWidget {
  final ExploreController exploreController;
  final ExerciceController exerciceController;
  const ListExerciceWithCategoryPage({
    Key? key,
    required this.exploreController,
    required this.exerciceController,
  }) : super(key: key);

  @override
  State<ListExerciceWithCategoryPage> createState() =>
      _ListExerciceWithCategoryPageState();
}

class _ListExerciceWithCategoryPageState
    extends State<ListExerciceWithCategoryPage> {
  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final item =
                widget.exploreController.state.listExercicesWithCategory[index];
            return ListTileTrainingDayWidget(
              exerciceModel: item,
              onTap: () {
                widget.exerciceController.setIsTtrainingDay(false);
                widget.exerciceController.selectExercice(item);
                Modular.to.pushNamed('/details_exercice_page');
              },
            );
          },
          separatorBuilder: (context, _) => SizedBox(
                height: size.height * 0.02,
              ),
          itemCount:
              widget.exploreController.state.listExercicesWithCategory.length),
    );
  }
}
