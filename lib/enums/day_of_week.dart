enum DayOfWeek {
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
  SUNDAY,
}

/// 오늘 날짜의 DayOfWeek 선택
DayOfWeek getTodayDayOfWeek() {
  DateTime today = DateTime.now();
  switch (today.weekday) {
    case DateTime.monday:
      return DayOfWeek.MONDAY;
    case DateTime.tuesday:
      return DayOfWeek.TUESDAY;
    case DateTime.wednesday:
      return DayOfWeek.WEDNESDAY;
    case DateTime.thursday:
      return DayOfWeek.THURSDAY;
    case DateTime.friday:
      return DayOfWeek.FRIDAY;
    case DateTime.saturday:
      return DayOfWeek.SATURDAY;
    case DateTime.sunday:
      return DayOfWeek.SUNDAY;
    default:
      throw Exception("Invalid day of week");
  }
}

// DayOfWeek enum 값을 한글 문자열로 변환하는 함수
String getKoreanDayOfWeek(DayOfWeek day) {
  switch (day) {
    case DayOfWeek.MONDAY:
      return '월';
    case DayOfWeek.TUESDAY:
      return '화';
    case DayOfWeek.WEDNESDAY:
      return '수';
    case DayOfWeek.THURSDAY:
      return '목';
    case DayOfWeek.FRIDAY:
      return '금';
    case DayOfWeek.SATURDAY:
      return '토';
    case DayOfWeek.SUNDAY:
      return '일';
  }
}
