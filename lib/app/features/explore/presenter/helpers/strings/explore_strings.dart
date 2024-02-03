class ExploreStrings {
  static const getExerciceWithCategory =
      r'''query MyQuery($category: exercice_category_enum_enum) {
  exercices(where: {category: {_eq: $category}}) {
    descryption
    difficulty
    id
    name
    image_exercice
    category
  }
}''';
}
