enum CategoryEnum {
  peito,
  pernas,
  biceps,
  panturrilhas,
  ombros,
  costas,
  gluteos,
  triceps
}

extension CategoryEnumExtension on CategoryEnum {
  static String convertEnumToString(CategoryEnum category) {
    switch (category) {
      case CategoryEnum.biceps:
        return 'Bíceps';
      case CategoryEnum.costas:
        return 'Costas';
      case CategoryEnum.gluteos:
        return 'Glúteos';
      case CategoryEnum.ombros:
        return 'Ombros';
      case CategoryEnum.peito:
        return 'Peito';
      case CategoryEnum.pernas:
        return 'Pernas';
      case CategoryEnum.triceps:
        return 'Triceps';
      default:
        return '';
    }
  }
}
