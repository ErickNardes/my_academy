import 'package:my_academy/app/features/exercices/model/exercice_model.dart';

abstract class IGetListExerciceRepository {
  Future<List<ExerciceModel>> getExercice(String param);
}
