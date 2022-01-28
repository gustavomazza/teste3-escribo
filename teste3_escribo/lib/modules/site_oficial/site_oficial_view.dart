import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/global/constants.dart';

class SiteOficial extends StatefulWidget {
  const SiteOficial({Key? key}) : super(key: key);

  @override
  _SiteOficialState createState() => _SiteOficialState();
}

class _SiteOficialState extends State<SiteOficial> {
  double _progress = 0;
  late InAppWebViewController webView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(defaultMargin * 2),
              width: Get.size.width * 0.3,
              height: Get.size.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Site Oficial',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(defaultMargin * 2),
              child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  elevation: 0,
                  child: FluttermojiCircleAvatar(
                    radius: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )
          ],
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
