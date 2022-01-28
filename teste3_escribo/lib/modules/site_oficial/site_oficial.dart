import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SiteOficial extends StatefulWidget {
  const SiteOficial({Key? key}) : super(key: key);

  @override
  _SiteOficialState createState() => _SiteOficialState();
}

class _SiteOficialState extends State<SiteOficial> {
  double _progress = 0;
  late InAppWebViewController webView;
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "teste",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
                url: Uri.parse('https://www.starwars.com/community')),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onProgressChanged:
                (InAppWebViewController controller, int progress) {
              setState(() {
                _progress = progress / 100;
              });
            },
          ),
          _progress < 1
              ? SizedBox(
                  height: 3,
                  child: LinearProgressIndicator(
                    value: _progress,
                    backgroundColor: Colors.blue,
                  ))
              : SizedBox()
        ],
      ),
    );
  }
}
