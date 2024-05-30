import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebview extends StatefulWidget {
  final String url;
  final String title;

  CustomWebview({
    super.key,
    this.title = '',
    required this.url,
  });

  @override
  State<CustomWebview> createState() => _CustomWebviewState();
}

class _CustomWebviewState extends State<CustomWebview> {
  late final WebViewController _webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onUrlChange: (UrlChange change) {},
        onHttpAuthRequest: (HttpAuthRequest request) {},
      ),
    )
    ..loadRequest(Uri.parse(widget.url));

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.white,
      appBar: AppBar(
        backgroundColor: CColors.white,
        iconTheme: IconThemeData(color: CColors.black),
      ),
      body: WebViewWidget(controller: _webViewController),
    );
  }
}
