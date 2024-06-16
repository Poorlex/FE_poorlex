import 'dart:async';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  // 아래의 3개는 고유한 사용자 정의 변수입니다
  static String _channelId = "poorlex_push_channel";
  static String _channelName = "poorlexChannel";
  static String _channelDescription = "poorlexNotificationChannel";
  LocalNotification._internal();

  factory LocalNotification() {
    return _instance;
  }

  static final LocalNotification _instance = LocalNotification._internal();

  int _id = 0;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings _androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final LinuxInitializationSettings _linuxSettings =
      LinuxInitializationSettings(
    defaultActionName: 'Open notification',
    defaultIcon: AssetsLinuxIcon('icons/app_icon.png'),
  );

  final DarwinInitializationSettings _iosSettings =
      const DarwinInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
  );

  InitializationSettings get _settings => InitializationSettings(
        android: _androidSettings,
        iOS: _iosSettings,
        macOS: _iosSettings,
        linux: _linuxSettings,
      );

  AndroidNotificationDetails get _androidDetails => AndroidNotificationDetails(
        //Android notification 상세 세팅
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        sound: RawResourceAndroidNotificationSound('push_notification'),
      );

  DarwinNotificationDetails get _iosDetails => const DarwinNotificationDetails(
        sound: 'push_notification.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );

  LinuxNotificationDetails get _linuxDetails => LinuxNotificationDetails(
        sound: AssetsLinuxSound('sound/slow_spring_board.mp3'), // 경로 맞춰야함.
      );

  NotificationDetails get _notificationDetails => NotificationDetails(
        android: _androidDetails,
        iOS: _iosDetails,
        macOS: _iosDetails,
        linux: _linuxDetails,
      );

  // 앱이 알림 관련 이벤트에 응답할 수 있도록 스트림이 생성됨
  static StreamController<LocalNotificationModel>
      didReceiveLocalNotificationStream =
      StreamController<LocalNotificationModel>.broadcast();

  static StreamController<String?> selectNotificationStream =
      StreamController<String?>.broadcast();

  Future<void> init() async {
    await Future.wait([
      _isAndroidPermissionGranted(),
      _requestPermissions(),
    ]);
    await _flutterLocalNotificationsPlugin.initialize(
      _settings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            selectNotificationStream.add(notificationResponse.payload);
            break;
          case NotificationResponseType.selectedNotificationAction:
            if (int.parse(notificationResponse.actionId ?? '') == _id) {
              selectNotificationStream.add(notificationResponse.payload);
            }
            break;
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  /// [MEMO] 테스트 메세지입니다.
  Future<void> showNotificationCustomSound() async {
    print("ㅇㅇㅇㅇㅇ");

    await _flutterLocalNotificationsPlugin.show(
      _id++,
      'custom sound notification title',
      'custom sound notification body',
      _notificationDetails,
    );
  }

  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled();
    }
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await _flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>();

      await androidImplementation?.requestNotificationsPermission();
    }
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(
      NotificationResponse notificationResponse) {
    // ignore: avoid_print
    print('notification(${notificationResponse.id}) action tapped: '
        '${notificationResponse.actionId} with'
        ' payload: ${notificationResponse.payload}');
    if (notificationResponse.input?.isNotEmpty ?? false) {
      // ignore: avoid_print
      print(
          'notification action tapped with input: ${notificationResponse.input}');
    }
  }
}

class LocalNotificationModel {
  LocalNotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
