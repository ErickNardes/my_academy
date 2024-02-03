class UserHasuraModel {
  final int id;
  final String firebaseId;
  final String name;
  final String email;
  UserHasuraModel({
    required this.id,
    required this.firebaseId,
    required this.name,
    required this.email,
  });

  static UserHasuraModel fromMap(Map<String, dynamic> map) {
    return UserHasuraModel(
        id: map['id'],
        firebaseId: map['firebase_id'],
        name: map['name'],
        email: map['email']);
  }
}
