import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/global/constants.dart';
import 'package:teste3_escribo/modules/avatar/avatar_edit_view.dart';
import 'package:teste3_escribo/modules/site_oficial/site_oficial_view.dart';
import 'package:fluttermoji/fluttermoji.dart';

class BarraSuperior extends StatelessWidget {
  const BarraSuperior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SiteOficial()));
              },
              child: Text(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AvatarEditView()));
              }),
        )
      ],
    );
  }
}
