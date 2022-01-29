import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> mensagem(String title, String middleText,
    {bool btOk = true,
    String textoOk = 'OK',
    bool btCancelar = false,
    String textoCancel = 'Cancelar'}) async {
  return await Get.defaultDialog(
    title: title,
    middleText: middleText,
    titleStyle:
        TextStyle(color: Get.theme.hintColor, fontWeight: FontWeight.bold),
    middleTextStyle: TextStyle(color: Get.theme.hintColor),
    cancelTextColor: Get.theme.primaryColor,
    cancel: Visibility(
      visible: btOk,
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
        child: Container(
          height: 40,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            border: Border.all(color: Get.theme.primaryColor, width: 1.0),
          ),
          child: SizedBox.expand(
            child: TextButton(
              child: Text(
                textoOk,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 17,
                ),
              ),
              onPressed: () {
                Get.back(result: true);
              },
            ),
          ),
        ),
      ),
    ),
    confirm: Visibility(
      visible: btCancelar,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
        child: Container(
          height: 40,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(color: Get.theme.primaryColor, width: 1.0),
          ),
          child: SizedBox.expand(
            child: TextButton(
              child: Text(
                textoCancel,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Get.theme.primaryColor,
                  fontSize: 17,
                ),
              ),
              onPressed: () {
                Get.back(result: false);
              },
            ),
          ),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
