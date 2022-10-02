// ignore_for_file: unnecessary_new, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_app/app/utils/styles/layout_config.dart';
import 'package:post_app/app/utils/styles/theme.dart';
import 'package:post_app/presentation/components/custom_button.dart';

class CustomAlert {
  SnackbarController success(String title, String msg) {
    return Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color.green,
      colorText: color.white,
      duration: const Duration(seconds: 3),
      icon: Icon(
        Icons.check_circle_rounded,
        color: color.white,
      ),
    );
  }

  SnackbarController error(String title, String msg) {
    return Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color.red,
      colorText: color.white,
      duration: const Duration(seconds: 3),
      icon: Icon(
        Icons.dangerous,
        color: color.white,
      ),
    );
  }

  Future confirmation(
    String message,
    Function onYes,
  ) {
    return Get.defaultDialog(
      title: "Confirm Decision?",
      middleText: message,
      barrierDismissible: false,
      titleStyle: textStyle.blackText.copyWith(
        fontSize: fontSize.subtitle,
        fontWeight: fontWeight.semiBold,
      ),
      middleTextStyle: textStyle.blackText,
      radius: layoutConfig.defaultMargin,
      contentPadding: EdgeInsets.all(layoutConfig.defaultMargin),
      actions: [
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: onYes,
                style: buttonStyle.primary,
                label: Text(
                  "yes",
                  style: textStyle.whiteText,
                ),
                height: layoutConfig.safeBlockVertical * 6.5,
              ),
            ),
            SizedBox(
              width: layoutConfig.defaultMargin,
            ),
            Expanded(
              child: CustomButton(
                onPressed: () {
                  Get.back();
                },
                style: buttonStyle.danger,
                label: Text(
                  "No",
                  style: textStyle.whiteText,
                ),
                height: layoutConfig.safeBlockVertical * 6.5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

CustomAlert alert = new CustomAlert();
