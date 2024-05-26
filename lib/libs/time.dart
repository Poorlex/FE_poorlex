import 'package:intl/intl.dart';

String cTimeFormat(int t, String format) {
  return DateFormat(format, 'ko')
      .format(DateTime.fromMillisecondsSinceEpoch(t));
}

String cFormatDateToString(DateTime date) {
  final String dateFormat = 'yyyy-MM-dd';
  return DateFormat(dateFormat).format(date);
}
