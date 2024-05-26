import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:poorlex/widget/gnb_layout.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'package:poorlex/models/login.dart';
import 'package:poorlex/models/user.dart';
import 'package:poorlex/controller/user.dart';

import 'package:poorlex/libs/theme.dart';

final List<LoginTypeObject> loginTypeObject = [
  LoginTypeObject(
      key: LoginTypes.kakao,
      url: '${dotenv.get('SERVER_URL')}/api/oauth2/authorization/kakao'),
  LoginTypeObject(
      key: LoginTypes.apple,
      url: '${dotenv.get('SERVER_URL')}/api/oauth2/authorization/apple')
];

class LoginModal extends StatefulWidget {
  LoginModal({super.key, required this.loginType});

  final loginType;

  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  final user = Get.find<UserController>();

  late final token;

  late final WebViewController webViewController;

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
          onNavigationRequest: (NavigationRequest change) async {
            // https://poorlex.com/login/success?accessToken=eyJhbGciOiJIUzM4NCJ9.eyJpYXQiOjE3MDgzOTQ1MzQsImV4cCI6MTgwODM5NDUzNCwibWVtYmVySWQiOjJ9.-LdfbqM8uvLNND9eKo-fFnzIxrM5El76__e1Dqf5LNokAT5K4xTnYPIK5nU88TAg
            if (change.url.contains('/login/success')) {
              print('!!!!');
              print(change.url);
              final uri = Uri.parse(change.url);
              if (uri.queryParameters['accessToken'] != null) {
                user.updateToken(
                    UserToken(token: uri.queryParameters['accessToken']!));

                await user.getUserInfo();
                Get.offAllNamed('/main', id: GNBLayout.globalKey);

                // 이동 방지
                return NavigationDecision.prevent;
              }
            }
            // 최종 이동
            return NavigationDecision.navigate;
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
      ..loadRequest(Uri.parse(
          loginTypeObject.firstWhere((e) => e.key == widget.loginType).url));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    webViewController = controller;

    return Scaffold(
        // backgroundColor: CColors.white,
        appBar: AppBar(
          backgroundColor: CColors.white,
          // foregroundColor: CColors.black,
          iconTheme: IconThemeData(color: CColors.black),
        ),
        body: WebViewWidget(controller: webViewController));
  }
}
