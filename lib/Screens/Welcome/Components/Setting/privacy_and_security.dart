import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Tab.dart';

class PrivacyAndSecurity extends StatelessWidget {
  const PrivacyAndSecurity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Privacy And Security"),
          leading:
          IconButton(onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => TabPage()
              ),
                  (Route<dynamic> route) => false
          ), icon: Icon(Icons.arrow_back))
      ),
      body: WebView(
        initialUrl: 'https://www.pdf24.org/en/privacy-policy',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
