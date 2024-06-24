import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookPage extends StatelessWidget {
  final String pdfUrl;

  const BookPage({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Reader'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://docs.google.com/gview?embedded=true&url=$pdfUrl',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
