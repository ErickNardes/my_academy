class HasuraExercicesQuery {
  static const getAllListExercices = '''query MyQuery {
  exercices {
    category
    descryption
    difficulty
    id
    image_exercice
    name
  }
}''';

  static const insertTrainingUser =
      r'''mutation MyMutation($objects: [day_training_users_insert_input!]!) {
  insert_day_training_users(objects: $objects) {
    affected_rows
  }
}
''';

  static const getListExercicesDay =
      r'''query MyQuery($day: String!, $idUser: Int!) {
  day_training_users(where: {day: {_eq: $day}, id_user: {_eq: $idUser}}) {
    exercice {
      category
      descryption
      difficulty
      id
      image_exercice
      name
    }
  }
}''';
}
