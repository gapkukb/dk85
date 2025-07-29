import 'package:app/helper/aaa.dart';
import 'package:app/i18n/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLanguagesPicker() async {
  final a = await Get.bottomSheet(
    Container(
      child: ElevatedButton(
        onPressed: () {
          Get.close(result: "ssssssss"); // Dismisses the bottom sheet
        },
        child: Text('Close'),
      ),
    ),
  );

  print(a);
}
