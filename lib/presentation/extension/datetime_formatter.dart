import 'dart:ui';
import 'package:intl/intl.dart';

class DateTimeFormatter {
  static dMy(String date) => DateFormat('d-MM-yyyy', const Locale.fromSubtags(languageCode: 'id').toString()).format(
        DateTime.parse(date),
      );

  static dMMMMyyy(String date) =>
      DateFormat('d MMMM yyyy', const Locale.fromSubtags(languageCode: 'id').toString()).format(
        DateTime.parse(date),
      );

  static dMMMMyyyHHmm(String date) =>
      DateFormat('d MMMM yyyy, HH:mm', const Locale.fromSubtags(languageCode: 'id').toString()).format(
        DateTime.parse(date),
      );

  static fullDatetimeNow() {
    int dayInt = DateTime.now().day;
    String day() {
      switch (dayInt) {
        case 1:
          return 'Senin';
        case 2:
          return 'Selasa';
        case 3:
          return 'Rabu';
        case 4:
          return 'Kamis';
        case 5:
          return 'Jum\'at';
        case 6:
          return 'Sabtu';
        case 7:
          return 'Minggu';
        default:
          return 'Senin';
      }
    }

    String date = DateTimeFormatter.dMMMMyyy(DateTime.now().toString());

    return '${day()}, $date';
  }
}
