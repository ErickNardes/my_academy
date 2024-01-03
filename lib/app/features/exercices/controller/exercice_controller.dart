// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:my_academy/app/features/exercices/controller/exercice_state.dart';
import 'package:my_academy/app/features/exercices/model/exercice_model.dart';
import 'package:my_academy/app/features/exercices/repository/i_get_list_top_exercice_repository.dart';
import 'package:my_academy/app/features/exercices/repository/i_training_repository.dart';

class ExerciceController extends Store<ExerciceState> {
  final IGetListExerciceRepository iGetListExerciceRepository;
  final ITrainingRepository iTrainingRepository;

  ExerciceController({
    required this.iGetListExerciceRepository,
    required this.iTrainingRepository,
  }) : super(ExerciceState.init());

  final filterExercice = TextEditingController(text: '');
  final categoryController = TextEditingController();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final difficultyController = TextEditingController();

  void setDaySelected(String day) {
    update(state.copyWith(daySelected: day));
  }

  void setDayIndex(int index) {
    update(state.copyWith(dayIndex: index));
  }

  // Future<void> getListExercicesWithDay() async {
  //   final result = await iTrainingRepository.getListTrainingWithDay(0);
  //   update(state.copyWith(listExercicesWithDay: result));
  // }

  Future<void> getListExercices() async {
    final result =
        await iGetListExerciceRepository.getExercice(filterExercice.text);

    update(state.copyWith(listExercices: result));
  }

  void selectExercice(ExerciceModel exercice) {
    update(state.copyWith(selectExercice: exercice));
  }

  Future<bool> addTrainingToDay(int dayIndex, String trainingId) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final CollectionReference userCollection =
          FirebaseFirestore.instance.collection('Users');
      final userDocRef = userCollection.doc(user!.uid);

      final CollectionReference treinosCollection =
          userDocRef.collection('treinos');

      await treinosCollection.doc(dayIndex.toString()).update({
        'id': FieldValue.arrayUnion([trainingId])
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
