import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser extends StatefulWidget {
  const Browser({Key key, this.url, this.title}) : super(key: key);

  final String url;
  final String title;

  @override
  WebViewExampleState createState() =>
      WebViewExampleState(url: this.url, title: this.title);
}

class WebViewExampleState extends State<Browser> {
  final String url;
  final String title;

  WebViewExampleState({this.url, this.title});

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title??""),
          centerTitle: true,
        ),
        body: WebView(
          initialUrl: this.url??"https://www.baidu.com",
        ));
  }
}
