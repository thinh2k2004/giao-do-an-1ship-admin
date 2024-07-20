import 'package:get/get_utils/get_utils.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String get formatCurrency {
    final money = num.tryParse(this);
    final format =
        NumberFormat.currency(locale: 'vi', decimalDigits: 0, symbol: 'đ');
    return format.format(money).replaceAll('.', ',');
  }

  String get formatNoSymbolCurrency {
    final money = num.tryParse(this);
    final format =
        NumberFormat.currency(locale: 'vi', decimalDigits: 0, symbol: '');
    return format.format(money).replaceAll(' ', '');
  }

  String get removeCurrency {
    return replaceAll('.', '').replaceAll(' ', '');
  }
}

extension StringValidateExtension on String {
  String? validatePhone(String value) {
    if (value.trim().isEmpty || value.trim() == '') {
      return 'phone_blank_err'.tr;
    }
    if (value.trim().length < 9 || value.trim().length > 15) {
      return 'phone_length_err'.tr;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.trim().isEmpty || value.trim() == '') {
      return 'password_blank_err'.tr;
    }

    if (value.trim().length < 6) return 'password_length_err'.tr;
    return null;
  }

  String? validateNewPassword(String value, String value2) {
    if (value.trim().isEmpty) return 'password_blank_err'.tr;

    if (value.trim().length < 6) return 'password_length_err'.tr;
    if (value.trim() != value2.trim()) return 'new_password_does_not_match'.tr;
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'valid_full_name_empty'.tr;
    } else if (value.trim().length < 6) {
      return 'valid_full_name_6_characters'.tr;
    }
    return null;
  }
}
