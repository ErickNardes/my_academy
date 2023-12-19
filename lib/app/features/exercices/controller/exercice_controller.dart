import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:my_academy/app/features/exercices/controller/exercice_state.dart';
import 'package:my_academy/app/features/exercices/repository/i_get_list_exercice_repository.dart';

class ExerciceController extends Store<ExerciceState> {
  final IGetListExerciceRepository iGetListExerciceRepository;
  ExerciceController({
    required this.iGetListExerciceRepository,
  }) : super(ExerciceState.init());
  final filterExercice = TextEditingController(text: '');

  Future<void> getListExercices() async {
    final result =
        await iGetListExerciceRepository.getExercice(filterExercice.text);

    update(state.copyWith(
        listExercices: result
            .where((element) => element.image != "https://wger.denull")
            .toList()));
  }
}
