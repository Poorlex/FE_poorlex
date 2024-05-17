import 'package:intl/intl.dart';

String cTimeFormat(int t, String format) {
  return DateFormat(format, 'ko')
      .format(DateTime.fromMillisecondsSinceEpoch(t));
}
