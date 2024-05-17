import 'package:intl/intl.dart';

bool checkRegex(String n, String v) {
  if (n == 'nickname') return RegExp(r'^.{2,15}$').hasMatch(v);
  return false;
}

String makeComma(num number) {
  return NumberFormat('###,###,###,000').format(number);
}
