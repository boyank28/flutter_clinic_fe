import 'package:intl/intl.dart';

String rupiahFormatter(String price) {
  return NumberFormat.simpleCurrency(locale: 'id', decimalDigits: 0).format(double.parse(price));
}
