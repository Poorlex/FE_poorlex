import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'package:poorlex/Libs/Theme.dart';

enum LoginTypes { kakao, apple }
class LoginTypeObject {
  late final String label;
  late final LoginTypes key;
  late final String url;
  LoginTypeObject({
    required this.label,
    required this.key,
    required this.url
  });
}
class LoginModal extends ModalRoute<void> {
  late final loginType;
  late final WebViewController webViewController;
  final List<LoginTypeObject> loginTypeObject = [
    LoginTypeObject(key: LoginTypes.kakao, label: '카카오로 로그인', url: dotenv.get('SERVER_URL')),
    LoginTypeObject(key: LoginTypes.apple, label: '애플로 로그인', url: dotenv.get('SERVER_URL'))
  ];

  LoginModal({ required this.loginType }){
    init();
  }

  init () {
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
          onProgress: (int progress) {
          },
          onPageStarted: (String url) {
          },
          onPageFinished: (String url) {
          },
          onWebResourceError: (WebResourceError error) {
          },
          onUrlChange: (UrlChange change) {
            print(change);
          },
          onHttpAuthRequest: (HttpAuthRequest request) {
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
        },
      )
      ..loadRequest(Uri.parse(loginTypeObject.firstWhere((e) => e.key == loginType).url));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    webViewController = controller;
  }

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

    return Scaffold(
      appBar: AppBar(
        title: Text(loginTypeObject.firstWhere((o) => o.key == loginType).label),
      ),
      body: WebViewWidget(controller: webViewController)
    );
  }
}
