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
}
