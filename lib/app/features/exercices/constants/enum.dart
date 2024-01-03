enum DaysOfWeekEnum {
  segunda,
  terca,
  quarta,
  quinta,
  sexta,
  sabado,
  domingo,
}

extension DaysOfWeekEnumExtension on DaysOfWeekEnum {
  static String convertEnumToString(DaysOfWeekEnum day) {
    switch (day) {
      case DaysOfWeekEnum.segunda:
        return 'Segunda-feira';
      case DaysOfWeekEnum.terca:
        return 'Terça-feira';
      case DaysOfWeekEnum.quarta:
        return 'Quarta-feira';
      case DaysOfWeekEnum.quinta:
        return 'Quinta-feira';
      case DaysOfWeekEnum.sexta:
        return 'Sexta-feira';
      case DaysOfWeekEnum.sabado:
        return 'Sábado';
      case DaysOfWeekEnum.domingo:
        return 'Domingo';
      default:
        return '';
    }
  }
}
