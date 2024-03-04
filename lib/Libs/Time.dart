import 'package:intl/intl.dart';

String CTimeFormat(int t, String format) {
  return DateFormat(format, 'ko').format(DateTime.fromMillisecondsSinceEpoch(t));
}