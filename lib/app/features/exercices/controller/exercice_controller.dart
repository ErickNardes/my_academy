// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:my_academy/app/features/exercices/controller/exercice_state.dart';
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';
import 'package:my_academy/app/features/exercices/params/get_list_exercice_day_params.dart';
import 'package:my_academy/app/features/exercices/params/insert_training_params.dart';
import 'package:my_academy/app/features/exercices/repository/i_delete_exercice_with_day_repository.dart';
import 'package:my_academy/app/features/exercices/repository/i_get_list_top_exercice_repository.dart';
import 'package:my_academy/app/features/exercices/repository/i_training_repository.dart';

class ExerciceController extends Store<ExerciceState> {
  final IGetListExerciceRepository iGetListExerciceRepository;
  final ITrainingRepository iTrainingRepository;
  final IDeleteExerciceWithDayRepository iDeleteExerciceWithDayRepository;

  ExerciceController({
    required this.iGetListExerciceRepository,
    required this.iTrainingRepository,
    required this.iDeleteExerciceWithDayRepository,
  }) : super(ExerciceState.init());

  final filterExercice = TextEditingController(text: '');
  final categoryController = TextEditingController();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final difficultyController = TextEditingController();

  void setIndexPage(int index) {
    update(state.copyWith(indexPage: index));
  }

  void setDayString(String day) {
    update(state.copyWith(dayString: day));
  }

  void setIsTtrainingDay(bool value) {
    update(state.copyWith(isTrainingDay: value));
  }

  void setDaySelected(String day) {
    update(state.copyWith(daySelected: day));
  }

  void setDayIndex(int index) {
    update(state.copyWith(dayIndex: index));
  }

  String setDayWithExplore(int index) {
    switch (index) {
      case 0:
        return 'segunda-feira';
      case 1:
        return 'terça-feira';
      case 2:
        return 'quarta-feira';
      case 3:
        return 'quinta-feira';
      case 4:
        return 'sexta-feira';
      case 5:
        return 'sábado';
      case 6:
        return 'domingo';
      default:
        return 'segunda-feira';
    }
  }

  Future<void> deleteExercice(int id, String day) async {
    final result =
        await iDeleteExerciceWithDayRepository.deleteExercice(id: id, day: day);
    result.fold((l) => setError, (r) => r);
  }

  Future<void> getListExercicesWithDay(GetListExercicesDayParams params) async {
    setLoading(true);
    final result = await iTrainingRepository.getListTrainingWithDay(params);
    result.fold((l) => setError, (r) {
      update(state.copyWith(listExercicesWithDay: r));
    });
    setLoading(false);
  }

  void selectMyExercice(ExerciceModel exercice) {
    update(state.copyWith(selectMyExercice: exercice));
  }

  Future<void> getListExercices() async {
    final result =
        await iGetListExerciceRepository.getExercice(filterExercice.text);

    update(state.copyWith(listExercices: result));
  }

  void selectExercice(ExerciceModel exercice) {
    update(state.copyWith(selectExercice: exercice));
  }

  Future<void> insertTraining(InsertTrainingParams params) async {
    final result = await iTrainingRepository.insertTraining(params);
    result.fold((l) => setError, (r) => r);
  }
}
