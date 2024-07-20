import 'package:base_getx/domain/repositories/authentication/i_authentication_repository.dart';
import 'package:base_getx/domain/utils/app_log.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

/// DOC
/// https://firebase.flutter.dev/docs/messaging/overview
class AppNotification {
  static final AppNotification _instance = AppNotification._();

  AppNotification._();

  factory AppNotification() {
    return _instance;
  }

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  final _localNotification = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    // _messaging
    //   ..setAutoInitEnabled(true)
    //   ..setForegroundNotificationPresentationOptions(alert: true, badge: true);

    /// Android 13 - SDK 33
    // final isGranted = _localNotification
    //     .resolvePlatformSpecificImplementation<
    //         AndroidFlutterLocalNotificationsPlugin>()
    //     ?.requestPermission();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      final String firebaseToken =
          Get.find<IAuthenticationRepository>().getFirebaseToken();
      AppLog.info('firebaseTokenSaved: $firebaseToken');
      if (firebaseToken.isEmpty) {
        final String token = await _messaging.getToken() ?? '';
        AppLog.info('firebaseToken: $token');
        // try {
        //   final String id =
        //       AppSharedPreference.instance.getValue<String>(PrefKeys.ID);
        //   final response = await Get.find<ApiClient>().postAuth(
        //     Address.updateFirebaseToken,
        //     data: {
        //       "ID": id,
        //       "Token": token,
        //     },
        //   );
        //   if (response.statusCode == 200) {
        //     AppSecureStorage.saveTokenFirebase(token);
        //   }
        // } catch (e) {
        //   AppLog.info("UpdateFirebaseToken error: " + e.toString());
        // }
        AppLog.info('Cập nhật firebaseToken thành công');
      }
      AppLog.info('Authenticate');
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      AppLog.info('Notification has denied');
    }

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    /// Called when user click in local notification
    _localNotification.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notification) {
        AppLog.info('onDidReceiveNotificationResponse ${notification.payload}');
      },
      onDidReceiveBackgroundNotificationResponse:
          (NotificationResponse notification) {
        AppLog.info(
            'onDidReceiveBackgroundNotificationResponse ${notification.payload}');
      },
    );

    /// Called when receive a FB message in the foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AppLog.info('onMessage: ${message.data}');
      if (message.notification != null) {
        final String payload = message.data['id'] ?? '';
        _showLocalNotification(
          message.notification!.hashCode,
          message.notification!.title ?? '',
          message.notification!.body ?? '',
          payload,
        );
      }
    });

    /// Called when receive a FB message in background or terminated
    // FirebaseMessaging.onBackgroundMessage((message) async {
    //   AppLog.info("onBackgroundMessage: " + message.toString());
    // if (message.notification != null) {
    //   cubit.checkHasNotify({"pageIndex": 1, "pageSize": 10});
    // }
    // });

    /// Called when user click FB notification and app is on background
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      AppLog.info('onMessageOpenedApp: $event');
      final String adminDocId = event.data['adminDocId'] ?? '';
      _changePage(adminDocId);
    });

    /// Called when user click FB notification and app is on terminated
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (event != null) {
        AppLog.info('getInitialMessage: $event');
        final String adminDocId = event.data['adminDocId'] ?? '';
        _changePage(adminDocId);
      }
    });
  }

  void _showLocalNotification(
    int id,
    String title,
    String body,
    String payload,
  ) {
    if (title.isNotEmpty && body.isNotEmpty) {
      const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'default_notification_channel_id',
        'All notification',
        icon: '@mipmap/ic_launcher',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        playSound: true,
      );
      const iOSPlatformChannelSpecifics = DarwinNotificationDetails();
      const platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );
      _localNotification.show(
        id,
        title,
        body,
        platformChannelSpecifics,
        payload: payload,
      );
    }
  }

  void _changePage(String payload) {
    // PayloadData payloadData = payloadDataFromJson(payload);
    // if (payloadData.type == "VAY") {}
  }
}
