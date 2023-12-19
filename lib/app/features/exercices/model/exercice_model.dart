// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExerciceModel {
  final String name;
  final int id;
  final int baseId;
  final String category;
  final String image;
  final String imageThumb;
  ExerciceModel({
    required this.name,
    required this.id,
    required this.baseId,
    required this.category,
    required this.image,
    required this.imageThumb,
  });

  static ExerciceModel fromMap(Map<String, dynamic> map) {
    return ExerciceModel(
        name: map['data']['name'],
        id: map['data']['id'],
        baseId: map['data']['base_id'],
        category: map['data']['category'],
        image: 'https://wger.de${map['data']['image']}' ?? '',
        imageThumb: 'https://wger.de${map['data']['image_thumbnail']}' ?? '');
  }
}
