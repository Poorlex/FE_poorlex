import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:poorlex/Models/Login.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/User.dart';
import 'package:poorlex/Models/User.dart';

final List<LoginTypeObject> loginTypeObject = [
  LoginTypeObject(key: LoginTypes.kakao, label: '카카오로 로그인', url: '${dotenv.get('SERVER_URL')}/api/oauth2/authorization/kakao'),
  LoginTypeObject(key: LoginTypes.apple, label: '애플로 로그인', url: '${dotenv.get('SERVER_URL')}/api/oauth2/authorization/apple')
];

class LoginModal extends ModalRoute<void> {
  late final token;
  late final loginType;
  late final WebViewController webViewController;
  final UserController user = Get.put(UserController());

  LoginModal ({ required this.loginType });

  @override
  Duration get transitionDuration => Duration(milliseconds: 0);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => CColors.black.withOpacity(1);

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {

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
            print(change.url);
            // https://poorlex.com/login/success?accessToken=eyJhbGciOiJIUzM4NCJ9.eyJpYXQiOjE3MDgzOTQ1MzQsImV4cCI6MTgwODM5NDUzNCwibWVtYmVySWQiOjJ9.-LdfbqM8uvLNND9eKo-fFnzIxrM5El76__e1Dqf5LNokAT5K4xTnYPIK5nU88TAg
            if (change.url != null && change.url!.contains('/login/success')) {
              List<String> s = change.url!.split('accessToken=');
              user.updateToken(UserToken(token: s[1]));
              Navigator.pop(context);
            }
          },
          onHttpAuthRequest: (HttpAuthRequest request) {
          },
        ),
      )
      /*
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
        },
      )
      */
      ..loadRequest(Uri.parse(loginTypeObject.firstWhere((e) => e.key == loginType).url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    webViewController = controller;

    return Scaffold(
      appBar: AppBar(
        title: Text(loginTypeObject.firstWhere((o) => o.key == loginType).label),
      ),
      body: WebViewWidget(controller: webViewController)
    );
  }
}
