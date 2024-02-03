// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:my_academy/app/features/exercices/constants/enum.dart';
import 'package:my_academy/app/features/exercices/params/get_list_exercice_day_params.dart';

import 'package:my_academy/app/features/exercices/params/insert_training_params.dart';
import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

import '../../controller/exercice_controller.dart';

class DetailsExercicePage extends StatefulWidget {
  final ExerciceController exerciceController;
  const DetailsExercicePage({
    Key? key,
    required this.exerciceController,
  }) : super(key: key);

  @override
  State<DetailsExercicePage> createState() => _DetailsExercicePageState();
}

class _DetailsExercicePageState extends State<DetailsExercicePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final exercice = widget.exerciceController.state.selectExercice;
    final user = Modular.get<LoginController>();
    return Scaffold(
      backgroundColor: ThemeColors.prymaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: ThemeColors.prymaryColor,
        title: const Text(
          'Detalhes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              child: Padding(
                padding: EdgeInsets.only(top: size.width * 0.02),
                child: Image.network(
                  exercice!.image,
                  fit: BoxFit.cover,
                  width: size.width,
                  height: size.height * 0.45,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.04,
                right: size.width * 0.04,
                top: size.width * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          exercice.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato-Bold',
                            fontSize: size.width * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    exercice.description,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: ThemeColors.secundaryColorText,
                      fontFamily: 'Lato-Regular',
                      fontSize: size.width * 0.04,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ValueListenableBuilder(
                valueListenable: widget.exerciceController.selectState,
                builder: (context, _, __) {
                  return Visibility(
                    visible: !widget.exerciceController.state.isTrainingDay,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                            barrierColor: Colors.grey.withOpacity(0.5),
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 300,
                                child: Dialog(
                                  backgroundColor: Colors.white,
                                  child: ValueListenableBuilder(
                                      valueListenable:
                                          widget.exerciceController.selectState,
                                      builder: (context, _, __) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              height: size.width * 0.03,
                                            ),
                                            DropdownButton(
                                                hint: Text(widget
                                                    .exerciceController
                                                    .state
                                                    .daySelected),
                                                items: DaysOfWeekEnum.values
                                                    .map((e) {
                                                  return DropdownMenuItem<
                                                      DaysOfWeekEnum>(
                                                    value: e,
                                                    child: Text(
                                                        DaysOfWeekEnumExtension
                                                            .convertEnumToString(
                                                                e)),
                                                  );
                                                }).toList(),
                                                onChanged: (v) {
                                                  final text =
                                                      DaysOfWeekEnumExtension
                                                          .convertEnumToString(
                                                              v!);
                                                  widget.exerciceController
                                                      .setDaySelected(text);
                                                  widget.exerciceController
                                                      .setDayIndex(v.index);
                                                }),
                                            SizedBox(
                                              height: size.width * 0.07,
                                            ),
                                            Image.network(exercice!.image),
                                            SizedBox(
                                              height: size.width * 0.07,
                                            ),
                                            Text(
                                              exercice.name,
                                              style: TextStyle(
                                                fontFamily: 'Lato-Bold',
                                                fontWeight: FontWeight.bold,
                                                fontSize: size.width * 0.05,
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () async {
                                                  final params =
                                                      InsertTrainingParams(
                                                    idUser: user.state
                                                        .userHasuraModel!.id,
                                                    idExercice: exercice.id,
                                                    day: widget
                                                        .exerciceController
                                                        .state
                                                        .daySelected
                                                        .toLowerCase(),
                                                  );
                                                  await widget
                                                      .exerciceController
                                                      .insertTraining(params);
                                                  final data = DateFormat(
                                                      'EEEE', 'pt_BR');

                                                  final dataParams =
                                                      GetListExercicesDayParams(
                                                    day: data
                                                        .format(DateTime.now()),
                                                    idUser: user.state
                                                        .userHasuraModel!.id,
                                                  );
                                                  widget.exerciceController
                                                      .getListExercicesWithDay(
                                                          dataParams);

                                                  Navigator.pop(context);

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                          content: Text(
                                                              'Treino Adicionado com Sucesso!!!')));
                                                },
                                                child: const Text(
                                                    'Adicionar Treino')),
                                            SizedBox(
                                              height: size.width * 0.07,
                                            ),
                                          ],
                                        );
                                      }),
                                ),
                              );
                            });
                      },
                      child: Text('Adicionar Treino'),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
