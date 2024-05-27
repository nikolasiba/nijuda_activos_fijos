class Utils {
  static String getInitials(String name) {
    List<String> nameSplit = name.split(" ");
    String initials = "";
    int numWords = nameSplit.length > 1 ? 2 : 1;
    for (var i = 0; i < numWords; i++) {
      initials += nameSplit[i][0];
    }
    return initials;
  }

  static String generateUuid() {
    DateTime now = DateTime.now();
    return now.year.toString() +
        now.month.toString() +
        now.day.toString() +
        now.hour.toString() +
        now.minute.toString() +
        now.second.toString() +
        now.millisecond.toString() +
        now.microsecond.toString();
  }
}
