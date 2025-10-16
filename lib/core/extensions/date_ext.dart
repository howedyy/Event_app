import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get viewMonthName{
     return DateFormat("MMM").format(this);
  }

  String get viewDayNumber{
    return day.toString();
  }
}