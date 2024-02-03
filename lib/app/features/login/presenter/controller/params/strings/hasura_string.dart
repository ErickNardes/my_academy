class HasuraUserString {
  static const insertUserHasuraMutation =
      r'''mutation MyMutation($objects: [users_insert_input!]!) {
  insert_users(objects: $objects) {
    affected_rows
  }
}
''';

  static const getUserWithFirebaseId = r'''query MyQuery($firebaseId: String!) {
  users(where: {firebase_id: {_eq: $firebaseId}}) {
    email
    firebase_id
    id
    name
  }
}
''';
}
