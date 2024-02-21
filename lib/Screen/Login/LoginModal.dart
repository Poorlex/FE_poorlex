import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'package:poorlex/Models/Login.dart';
import 'package:poorlex/Models/User.dart';
import 'package:poorlex/Controller/User.dart';

final List<LoginTypeObject> loginTypeObject = [
  LoginTypeObject(
      key: LoginTypes.kakao,
      label: '카카오로 로그인',
      url: '${dotenv.get('SERVER_URL')}/api/oauth2/authorization/kakao'),
  LoginTypeObject(
      key: LoginTypes.apple,
      label: '애플로 로그인',
      url: '${dotenv.get('SERVER_URL')}/api/oauth2/authorization/apple')
];

class LoginModal extends StatelessWidget {
  late final token;
  late final loginType;
  late final WebViewController webViewController;
  final user = Get.find<UserController>();

  LoginModal({super.key, required this.loginType});

  @override
  Widget build(BuildContext context) {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onUrlChange: (UrlChange change) {
            // https://poorlex.com/login/success?accessToken=eyJhbGciOiJIUzM4NCJ9.eyJpYXQiOjE3MDgzOTQ1MzQsImV4cCI6MTgwODM5NDUzNCwibWVtYmVySWQiOjJ9.-LdfbqM8uvLNND9eKo-fFnzIxrM5El76__e1Dqf5LNokAT5K4xTnYPIK5nU88TAg
            if (change.url != null && change.url!.contains('/login/success')) {
              final uri = Uri.parse(change.url!);
              if (uri.queryParameters['accessToken'] != null) {
                user.updateToken(
                    UserToken(token: uri.queryParameters['accessToken']!));
                Get.offAndToNamed('/home');
              }
            }
          },
          onHttpAuthRequest: (HttpAuthRequest request) {},
        ),
      )
      /*
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
        },
      )
      */
      ..loadRequest(
          Uri.parse(loginTypeObject.firstWhere((e) => e.key == loginType).url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    webViewController = controller;

    return Scaffold(
        appBar: AppBar(
          title:
              Text(loginTypeObject.firstWhere((o) => o.key == loginType).label),
          // title: Obx(() => Text("${user.userInfo.value.userId}")),
        ),
        body: WebViewWidget(controller: webViewController));
  }
}
