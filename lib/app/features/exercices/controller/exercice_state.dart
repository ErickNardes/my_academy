// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';

class ExerciceState {
  final List<ExerciceModel> listExercices;
  ExerciceState({
    required this.listExercices,
  });

  factory ExerciceState.init() => ExerciceState(
        listExercices: [],
      );

  ExerciceState copyWith({
    List<ExerciceModel>? listExercices,
  }) {
    return ExerciceState(
      listExercices: listExercices ?? this.listExercices,
    );
  }
}
