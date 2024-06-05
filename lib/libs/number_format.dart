import 'package:intl/intl.dart';

String formatCurrencyWithWon(int amount) {
  final formatter = NumberFormat("###,###,###,###");
  return "${formatter.format(amount)}원";
}
