import 'dart:convert';

import 'package:my_academy/app/features/exercices/constants/strings.dart';
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';
import 'package:my_academy/app/features/exercices/repository/i_get_list_exercice_repository.dart';
import 'package:http/http.dart' as http;

class GetListExerciceRepository implements IGetListExerciceRepository {
  const GetListExerciceRepository();

  @override
  Future<List<ExerciceModel>> getExercice(String param) async {
    try {
      final response =
          await http.get(Uri.parse('$getListExerciceString$param'));
      final data = jsonDecode(response.body);
      final result = List.from(data['suggestions']);
      return result.map((e) => ExerciceModel.fromMap(e)).toList();
    } catch (e) {
      Exception('Erro ao buscar Dados');
      return [];
    }
  }
}
