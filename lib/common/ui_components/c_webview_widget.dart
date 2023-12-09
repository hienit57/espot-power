import 'package:espot_power/utils/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class CWebviewWidget extends StatelessWidget {
  const CWebviewWidget({
    super.key,
    required this.url,
    this.onMessageReceived,
    this.channelName,
    this.onMessageReceivedOnWebWindow,
  });
  final String url;
  final void Function(JavaScriptMessage)? onMessageReceived;
  final void Function(JavaScriptMessage)? onMessageReceivedOnWebWindow;

  final String? channelName;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(
            controller: PlatformWebViewController(
          const PlatformWebViewControllerCreationParams(),
        )..loadRequest(LoadRequestParams(uri: Uri.parse(url)))),
      ).build(context);
    }
    return WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
              },
              onPageStarted: (String url) {
                logger.d('message 1');
              },
              onPageFinished: (String url) {
                logger.d('message 2');
              },
              onWebResourceError: (WebResourceError error) {
                logger.d('message Error');
              },
            ),
          )
          ..setOnConsoleMessage((message) {
            logger.d('New message from console ${message.message}');
          })
          ..addJavaScriptChannel(channelName ?? 'JS-Channel',
              onMessageReceived: onMessageReceived ??
                  (message) {
                    logger.d('message $message');
                  })
          ..loadRequest(Uri.parse(url)));
  }
}
