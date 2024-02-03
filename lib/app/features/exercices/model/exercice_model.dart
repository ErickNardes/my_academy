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
  }
}
