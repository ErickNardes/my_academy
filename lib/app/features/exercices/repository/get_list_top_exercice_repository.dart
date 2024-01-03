import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:my_academy/app/features/exercices/constants/strings.dart';
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';
import 'package:my_academy/app/features/exercices/repository/i_get_list_top_exercice_repository.dart';

class GetListExerciceRepository implements IGetListExerciceRepository {
  final HasuraConnect hasuraConnect;
  const GetListExerciceRepository(this.hasuraConnect);

  @override
  Future<List<ExerciceModel>> getExercice(String param) async {
    try {
      final response =
          await hasuraConnect.query(HasuraExercicesQuery.getAllListExercices);
      final data = List.from(response['data']['exercices']);
      final result = data.map((e) => ExerciceModel.fromMap(e)).toList();
      return result;
    } catch (e) {
      throw Exception('Erro ao buscar dados: $e');
    }
  }
}
