import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {

  final String url ;
   const WebViewScreen(this.url, {Key key}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: url ,
      ),
    );
  }
}
