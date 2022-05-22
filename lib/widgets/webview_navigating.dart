import 'package:doanchuyennganh/Screens/Welcome/Components/Tab.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNavigating extends StatefulWidget {
  const WebViewNavigating({
    // required this.path,
    Key? key}) : super(key: key);
  // final String path;
  @override
  State<WebViewNavigating> createState() => _WebViewNavigatingState();
}

class _WebViewNavigatingState extends State<WebViewNavigating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WebView"),
        leading:
          IconButton(onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => TabPage()
              ),
                  (Route<dynamic> route) => false
          ), icon: Icon(Icons.arrow_back))
      ),
      body: WebView(
        initialUrl: 'http://www.google.com',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
