import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get toDDmmYYYY => DateFormat('dd/MM/yyyy').format(this);

  String get toDDmmYYYYhhMM => DateFormat('dd/MM/yyyy HH:mm').format(this);
}
