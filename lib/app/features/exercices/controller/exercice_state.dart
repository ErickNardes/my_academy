// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';

class ExerciceState {
  final List<ExerciceModel> listExercicesWithDay;
  final int dayIndex;
  final String daySelected;
  final List<ExerciceModel> listExercices;
  final ExerciceModel? selectExercice;
  ExerciceState({
    required this.listExercicesWithDay,
    required this.dayIndex,
    required this.daySelected,
    required this.listExercices,
    required this.selectExercice,
  });

  factory ExerciceState.init() => ExerciceState(
        listExercices: [],
        selectExercice: null,
        daySelected: 'Segunda-Feira',
        dayIndex: 0,
        listExercicesWithDay: [],
      );

  ExerciceState copyWith({
    List<ExerciceModel>? listExercicesWithDay,
    int? dayIndex,
    String? daySelected,
    ExerciceModel? selectExercice,
    List<ExerciceModel>? listExercices,
  }) {
    return ExerciceState(
      listExercices: listExercices ?? this.listExercices,
      selectExercice: selectExercice ?? this.selectExercice,
      daySelected: daySelected ?? this.daySelected,
      dayIndex: dayIndex ?? this.dayIndex,
      listExercicesWithDay: listExercicesWithDay ?? this.listExercicesWithDay,
    );
  }
}
