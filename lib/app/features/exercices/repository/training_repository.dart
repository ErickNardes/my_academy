import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_academy/app/features/exercices/model/training_model.dart';
import 'package:my_academy/app/features/exercices/repository/i_training_repository.dart';

import '../model/exercice_model.dart';

class TrainingRepository implements ITrainingRepository {
  @override
  Future<void> insertTraining(TrainingModel params) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      final CollectionReference userCollection =
          FirebaseFirestore.instance.collection('Users');
      final userDocRef = userCollection.doc(user!.uid);

      final CollectionReference treinosCollection =
          userDocRef.collection('treinos');

      await treinosCollection.doc(params.index.toString()).update(
        {
          'id': FieldValue.arrayUnion([params.id])
        },
      );
    } catch (e) {
      throw Exception('Erro ao adicionar treino!');
    }
  }

  // @override
  // Future<List<ExerciceModel>> getListTrainingWithDay(int indexDay) async {
  //   // try {
  //   //   User? user = FirebaseAuth.instance.currentUser;
  //   //   CollectionReference userCollection =
  //   //       FirebaseFirestore.instance.collection('Users');
  //   //   var userDocRef = userCollection.doc(user!.uid);
  //   //   CollectionReference treinosCollection = userDocRef.collection('treinos');

  //   //   QuerySnapshot doc =
  //   //       await treinosCollection.where('document', isEqualTo: indexDay).get();

  //   //   var response = doc.docs.map((e) {
  //   //     return ExerciceModel(
  //   //       name: e['name'],
  //   //       id: e.id,
  //   //       category: e['category'],
  //   //       image: e['image'],
  //   //       difficulty: e['difficulty'],
  //   //       description: e['description'],
  //   //     );
  //   //   }).toList();

  //   //   return response;
  //   // } catch (e) {
  //   //   throw Exception('Erro ao buscar exercícios do dia');
  //   // }
  // }
}
