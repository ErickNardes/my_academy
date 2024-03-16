// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:my_academy/app/features/exercices/controller/exercice_controller.dart';
import 'package:my_academy/app/features/exercices/params/get_list_exercice_day_params.dart';
import 'package:my_academy/app/features/exercices/presenter/widgets/list_tile_training_day_widget.dart';
import 'package:my_academy/app/features/login/presenter/controller/login_controller.dart';
import 'package:my_academy/app/features/performace/presenter/widgets/list_days_widget.dart';
import 'package:my_academy/app/features/performace/presenter/widgets/list_tile_my_exercices_widget.dart';
import 'package:my_academy/core/theme/theme_colors.dart';

class PerfomacePage extends StatefulWidget {
  final ExerciceController controller;
  const PerfomacePage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PerfomacePage> createState() => _PerfomacePageState();
}

class _PerfomacePageState extends State<PerfomacePage> {
  final userState = Modular.get<LoginController>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> daysOfWeek = ['S', 'T', 'Q', 'Q', 'S', 'S', 'D'];

    return Scaffold(
      body: DefaultTabController(
        length: daysOfWeek.length,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.05, // Defina a altura desejada
                child: TabBar(
                  onTap: (value) async {
                    final day = widget.controller.setDayWithExplore(value);
                    await widget.controller.getListExercicesWithDay(
                        GetListExercicesDayParams(
                            day: day,
                            idUser: userState.state.userHasuraModel!.id));
                    widget.controller.setDayString(day);
                  },
                  indicatorColor: ThemeColors.backgroudColor,
                  physics: const NeverScrollableScrollPhysics(),
                  indicatorPadding: EdgeInsets.zero,
                  tabs: daysOfWeek
                      .map((day) => Container(
                            width: size.width * 0.16, // Ajusta a largura do Tab
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: ThemeColors.prymaryGreenColor,
                            ),
                            child: Center(
                              child: Text(
                                day,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              ScopedBuilder(
                store: widget.controller,
                onLoading: (context) => const Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation(ThemeColors.backgroudColor),
                  ),
                ),
                onState: (context, state) {
                  return Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: size.height * 0.02,
                              ),
                          itemCount: widget
                              .controller.state.listExercicesWithDay.length,
                          itemBuilder: (context, index) {
                            final item = widget
                                .controller.state.listExercicesWithDay[index];
                            return ListTileMyExercicesWidget(
                              idUser: userState.state.userHasuraModel!.id,
                              controller: widget.controller,
                              exerciceModel: item,
                              index: index,
                            );
                          }));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
