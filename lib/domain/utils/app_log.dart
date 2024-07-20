import 'dart:developer';
import 'package:base_getx/domain/extension/date_time_extension.dart';
import 'package:get/get.dart';

/*
Meaning:
    \x1B: ANSI escape sequence starting marker
    [31m: Escape sequence for red
    [0m: Escape sequence for reset (stop making the text red)
    
Here are the other colors:
    Black:   \x1B[30m
    Red:     \x1B[31m
    Green:   \x1B[32m
    Yellow:  \x1B[33m
    Blue:    \x1B[34m
    Magenta: \x1B[35m
    Cyan:    \x1B[36m
    White:   \x1B[37m
    Reset:   \x1B[0m
*/

enum LogType {
  INFO,
  WARNING,
  ERROR;

  bool get isInfo => this == INFO;

  bool get isWarning => this == WARNING;

  bool get isError => this == ERROR;
}

class CommonLog {
  final String message;
  final LogType type;
  final String time;

  CommonLog({
    required this.message,
    required this.type,
    required this.time,
  });
}

class AppLog {
  static final List<CommonLog> _listLog = <CommonLog>[].obs;

  static List<CommonLog> get listLog => _listLog;
  static bool needShowLog = false;

  /// Log the detailed error in the console with red color.
  /// Log error to Firebase Crashlytics.
  static void error(String message, [Object? error, StackTrace? trace]) {
    if (needShowLog) {
      log('\x1B[31m$message\x1B[0m');
      if (error != null) log('\x1B[31m$error\x1B[0m');
      if (trace != null) log('\x1B[33m$trace\x1B[0m');
      _listLog.insert(
        0,
        CommonLog(
          message: message,
          type: LogType.ERROR,
          time: DateTime.now().toDDmmYYYYhhMM,
        ),
      );
    }

    // FirebaseCrashlytics.instance.recordError(error, trace, printDetails: true);
  }

  /// Log the detailed warning in the console with yellow color.
  static void warning(String message, [Object? obj, StackTrace? trace]) {
    if (needShowLog) {
      log('\x1B[33m$message\x1B[0m');
      if (obj != null) log('\x1B[33m$obj\x1B[0m');
      if (trace != null) log('\x1B[33m$trace\x1B[0m');
      _listLog.insert(
        0,
        CommonLog(
          message: message,
          type: LogType.WARNING,
          time: DateTime.now().toDDmmYYYYhhMM,
        ),
      );
    }
  }

  /// Log the detailed info in the console with Green color.
  static void info(String message, [Object? obj, StackTrace? trace]) {
    if (needShowLog) {
      log('\x1B[32m$message\x1B[0m');
      if (obj != null) log('\x1B[32m$obj\x1B[0m');
      if (trace != null) log('\x1B[33m$trace\x1B[0m');
      _listLog.insert(
        0,
        CommonLog(
          message: message,
          type: LogType.INFO,
          time: DateTime.now().toDDmmYYYYhhMM,
        ),
      );
    }
  }

  static void clearLog() {
    _listLog.clear();
  }
}
