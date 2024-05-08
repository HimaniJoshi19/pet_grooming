import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_grooming/constants/string_constants.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';
import 'package:pet_grooming/utils/force_update_remote_config/remote_config_service.dart';
import 'package:pet_grooming/utils/utility.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

enum UpdateType { forceUpdate, update, notUpdate }

class CheckForceUpdate {
  //KEEP IN MIND: In this scenario logic will not work where version name's middle digit in two digit long
  //for example your current app version is 1.24.1 and remote version in 1.3.0, logically remote version is higher then current app version
  //But in this where remove dots value became for current version is 1241 and remove version is 130, So condition will not satisfied not show the popup

  CheckForceUpdate({required this.remoteConfigService});

  final RemoteConfigService remoteConfigService;

  Future<UpdateType> isForceUpdateRequired({PackageInfo? packageInfoParam,}) async {
    //FORCE UPDATE
    // final int currentAppVersion = 99;
    // final int lastForceUpdateVersion = 100;
    // final int remoteAppVersion = 98;
    // final bool isForceUpdate = true;

    //UPDATE
    // final int currentAppVersion = 99;
    // final int lastForceUpdateVersion = 99;
    // final int remoteAppVersion = 100;
    // final bool isForceUpdate = false;

    //NO UPDATE
    /*final int currentAppVersion = 99;
    final int lastForceUpdateVersion = 99;
    final int remoteAppVersion = 98;
    final bool isForceUpdate = false;*/

    final int currentAppVersion = await getAppVersionNumber(packageInfoParam: packageInfoParam);

    final int lastForceUpdateVersion = _convertStringToInt(
      Platform.isIOS
          ? remoteConfigService.getIosLastForceUpdateVersion
          : remoteConfigService.getAndroidLastForceUpdateVersion,
    );

    final int remoteAppVersion = _convertStringToInt(
      Platform.isIOS
          ? remoteConfigService.getIosVersion
          : remoteConfigService.getAndroidVersion,
    );

    final bool isForceUpdate = Platform.isIOS
        ? remoteConfigService.getIosForceUpdate
        : remoteConfigService.getAndroidForceUpdate;

    Utility.showLog(
      'Force Update Configuration: \ncurrentAppVersion:$currentAppVersion\nlastForceUpdateVersion:$lastForceUpdateVersion\nremoteAppVersion:$remoteAppVersion\nisForceUpdate:$isForceUpdate',
    );

    if (currentAppVersion < lastForceUpdateVersion) {
      return UpdateType.forceUpdate;
    } else {
      if (currentAppVersion < remoteAppVersion) {
        if (isForceUpdate) {
          return UpdateType.forceUpdate;
        } else {
          return UpdateType.update;
        }
      } else {
        return UpdateType.notUpdate;
      }
    }
  }

  Future<int> showUpdateDialog(
    BuildContext context, {
    bool isForceUpdate = false,
  }) async {
    int returnResult = 1;
    await CustomDialogView()
        .showDialogCustom(
      barrierDismissible: false,
      context: context,
      title: StringConstants.labelUpdate,
      content: StringConstants.labelUpdateMsg,
      positiveButtonText: StringConstants.labelUpdate,
      negativeButtonText:
          isForceUpdate ? StringConstants.labelExit : StringConstants.labelOk,
    )
        .then((int? value) async {
      if (value == 0) {
        launchUrl(Uri.parse(StringConstants.appPlayStoreUrl));
        returnResult =
            await showUpdateDialog(context, isForceUpdate: isForceUpdate);
      } else {
        if (isForceUpdate) {
          exit(0);
        }
        returnResult = 1;
      }
    });
    return returnResult;
  }

  Future<int> getAppVersionNumber({PackageInfo? packageInfoParam}) async {
    if (packageInfoParam == null) {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return _convertStringToInt(
        packageInfo.version,
      );
    } else {
      return _convertStringToInt(
        packageInfoParam.version,
      );
    }
  }

  int _convertStringToInt(String text) {
    return int.parse(text.replaceAll('.', ''));
  }
}
