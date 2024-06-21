class LogicHelpers {
  static num convertDegreeFromCelsiusToFahrenheit(num celsius) {
    return (celsius * 9 / 5) + 32;
  }

  static String getTimeFromSeconds(int seconds) {
    final int minutes = (seconds % 3600) ~/ 60;
    final int secondsLeft = seconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:${secondsLeft.toString().padLeft(2, '0')}';
  }

  static String getTimeIsSecondOrMinOrHour(int seconds) {
    if(seconds < 60) {
      return 'Seconds';
    } else if(seconds < 3600) {
      return 'Minutes';
    } else {
      return 'Hours';
    }
  }

  static double getNearestEnd(int seconds) {
    if(seconds < 60) {
      return seconds / 60;
    } else if(seconds < 3600) {
      return seconds / 3600;
    } else if (seconds < 86400) {
      return seconds / 86400;
    } else if(seconds < 31536000) {
      return seconds / 31536000;
    } else {
      return seconds / 3153600000;
    }
  }
}
