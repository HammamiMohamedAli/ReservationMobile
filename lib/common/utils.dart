// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yallaplay_mobile/common/colors.dart';

class Utils {
  static void showLoader(String message) {
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.backgroundColor = Colors.white;
    EasyLoading.instance.indicatorColor = AppColors.yellow;
    EasyLoading.instance.textColor = AppColors.textColor;
    EasyLoading.show(status: message);
  }

  static void dismissLoader() {
    EasyLoading.dismiss();
  }

  static void showsuccess(String message) {
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.backgroundColor = AppColors.yellow;
    EasyLoading.instance.indicatorColor = Colors.white;
    EasyLoading.instance.textColor = Colors.white;
    EasyLoading.showSuccess(message);
  }

  static void showError(String message) {
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.backgroundColor = AppColors.red;
    EasyLoading.instance.indicatorColor = Colors.white;
    EasyLoading.instance.textColor = Colors.white;
    EasyLoading.showError(message);
  }

  static void showErrorEmail(String message) {
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.backgroundColor = AppColors.red;
    EasyLoading.instance.indicatorColor = Colors.white;
    EasyLoading.instance.textColor = Colors.white;
    EasyLoading.showError(message);
  }
}
