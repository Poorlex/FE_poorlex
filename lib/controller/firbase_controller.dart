import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:poorlex/widget/common/dialog/common_alert.dart';

class FirebaseController {
  FirebaseController._internal();

  factory FirebaseController() {
    return _instance;
  }

  static final FirebaseController _instance = FirebaseController._internal();
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  Future<void> init(Future<void> Function(RemoteMessage) handler) async {
    await _firebaseMessaging.setAutoInitEnabled(true);
    await _requestPermission();
    await _setupInteractedMessage();
    _onTokenRefresh();
    _foregroundMessageListen();
    _backgroundMessageListen();
    FirebaseMessaging.onBackgroundMessage(handler);

    final fcmToken = await _firebaseMessaging.getToken();
    print(">>>>> fcmToken $fcmToken");
  }

  Future<void> showFcmToken({required BuildContext context}) async {
    final fcmToken = await _firebaseMessaging.getToken();
    print(">>>>> fcmToken $fcmToken");
    commonAlert(context: context, message: fcmToken ?? '');
  }

  /// 토큰이 재생성되었을때,
  void _onTokenRefresh() {
    _firebaseMessaging.onTokenRefresh.listen((fcmToken) {
      // TODO: If necessary send token to application server.

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {
      // Error getting token.
    });
  }

  /// [메시지를 수신할 수 있는 권한 요청](https://firebase.google.com/docs/cloud-messaging/flutter/receive?authuser=1&hl=ko#request_permission_to_receive_messages_apple_and_web)
  Future<void> _requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  /// https://firebase.google.com/docs/cloud-messaging/flutter/first-message?hl=ko&authuser=1
  /// getInitialMessage(): 애플리케이션이 종료된 상태에서 열리면 이 메서드는 RemoteMessage가 포함된 Future를 반환합니다. 소비되면 RemoteMessage가 삭제됩니다.
  Future<void> _setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await _firebaseMessaging.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
  }

  /// 포그라운드 메세지
  void _foregroundMessageListen() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  /// 앱이 백그라운드에 있을 경우
  void _backgroundMessageListen() {
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  /// fcm massage 라우팅
  void _handleMessage(RemoteMessage message) {
    if (message.data['type'] == 'chat') {}
  }
}
