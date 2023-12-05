class TimeUtils {
  TimeUtils._();

  static bool timeIsInRange(DateTime lowerBound, DateTime upperBound) {
    if (DateTime.now().isAfter(lowerBound) &&
        DateTime.now().isBefore(upperBound)) {
      return true;
    }
    return false;
  }

  static bool timeIsToday(DateTime date) {
    if (DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day) ==
        DateTime(date.year, date.month, date.day)) {
      return true;
    }
    return false;
  }

  static bool timeIsBefore(DateTime date) {
    if (DateTime.now().isBefore(date)) {
      return true;
    }
    return false;
  }

  static bool timeIsAfter(DateTime date) {
    if (DateTime.now().isAfter(date)) {
      return true;
    }
    return false;
  }
}
