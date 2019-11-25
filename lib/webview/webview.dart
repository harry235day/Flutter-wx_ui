import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class webview extends StatelessWidget {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Future<bool> callgoBack = flutterWebviewPlugin.canGoBack();
        callgoBack.then((flag) {
          if (flag) {
            flutterWebviewPlugin.goBack();
          } else {
            if (flutterWebviewPlugin != null) {
              flutterWebviewPlugin.clearCache();
              flutterWebviewPlugin.onDestroy;
            }
            flutterWebviewPlugin.dispose();
            Navigator.of(context).pop();
          }
        });
      },
      child: WebviewScaffold(
        url: "https://www.baidu.com/",
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Icon(Icons.camera_enhance),
            )
          ],
        ),
        withJavascript: true,
        withZoom: true,
        withLocalStorage: true,
      ),
    );
  }
}
