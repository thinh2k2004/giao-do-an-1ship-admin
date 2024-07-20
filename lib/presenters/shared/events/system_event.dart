import 'dart:async';

enum SystemEventType {
  LOGIN,
  LOGOUT,
  FORCE_LOGOUT;
}

abstract class SystemEvent {
  static final StreamController<SystemEventType> _streamController =
      StreamController<SystemEventType>.broadcast();

  static Stream<SystemEventType> get systemEventStream =>
      _streamController.stream;

  static void addEvent(SystemEventType event) {
    _streamController.add(event);
  }
}
