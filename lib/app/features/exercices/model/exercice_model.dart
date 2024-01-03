// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciceModel {
  final String name;
  final int id;
  final String category;
  final String image;
  final String difficulty;
  final String description;
  ExerciceModel({
    required this.name,
    required this.id,
    required this.category,
    required this.image,
    required this.difficulty,
    required this.description,
  });

  static ExerciceModel fromMap(Map<String, dynamic> map) {
    return ExerciceModel(
        name: map['name'],
        id: map['id'],
        category: map['category'],
        image: map['image_exercice'],
        difficulty: map['difficulty'],
        description: map['descryption']);

    //       category
    // descryption
    // difficulty
    // id
    // image_exercice
    // name
  }
}
