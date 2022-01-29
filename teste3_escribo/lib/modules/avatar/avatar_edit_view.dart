import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/global/constants.dart';

class AvatarEditView extends StatelessWidget {
  const AvatarEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    var isWeb = platform != TargetPlatform.android ||
        platform != TargetPlatform.iOS ||
        platform != TargetPlatform.fuchsia;

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
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: FluttermojiCircleAvatar(
              radius: 75,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: FluttermojiCustomizer(
              showSaveWidget: true,
              scaffoldWidth: isWeb ? 600 : 0,
            ),
          ),
        ],
      ),
    );
  }
}
