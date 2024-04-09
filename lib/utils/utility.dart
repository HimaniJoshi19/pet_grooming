// ignore_for_file: depend_on_referenced_packages
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/flash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_grooming/presentation/themes/palette.dart';
import 'package:pet_grooming/presentation/themes/text_styles.dart';
import 'package:pet_grooming/presentation/widgets/components.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

extension DoubleCasingExtension on double {
  String extTwo() {
    return toStringAsFixed(2).replaceAll('.00', '');
  }
}

class Utility {
  static RegExp getEmailRegExp() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
  }

  static bool emailValidator({required String email}) {
    return getEmailRegExp().hasMatch(email);
  }

  static void showLog(String value, {String key = 'Result'}) {
    if (kDebugMode) {
      log('$key : $value');
    }
  }

  static void hideKeyBoard({BuildContext? context}) {
    if (context != null) {
      FocusScope.of(context).requestFocus(FocusNode());
    }

    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static String? getUserId({FirebaseAuth? firebaseAuth}) {
    final FirebaseAuth auth = firebaseAuth ?? FirebaseAuth.instance;
    return auth.currentUser?.uid;
  }
  
  static String dateToString(DateTime? date, String format) {
    if (date != null) {
      final DateFormat f = DateFormat(format);

      final String strDt = f.format(date);
      return strDt;
    } else {
      return '';
    }
  }

  static Future<File?> localFile() async {
    if (Platform.isIOS) {
      if (await Permission.storage.request().isGranted) {
        final Directory directory = await getApplicationDocumentsDirectory();
        return File('${directory.path}/');
      } else {
        openAppSettings();
        return null;
      }
    } else {
      if (await Permission.storage.request().isGranted) {
        final Directory path = Directory('/storage/emulated/0/Download');
        return File('${path.path}/');
      } else {
        openAppSettings();
        return null;
      }
    }
  }

  static Future<File?> downloadFile({required String url}) async {
    final File? appStorage = await localFile();
    if (appStorage != null) {
      final String fileName = url.substring(
        url.lastIndexOf('/') + 1,
        url.length,
      );
      final String strPath =
          '${appStorage.path}${fileName.split('.').toList().first}_${DateTime.now().millisecondsSinceEpoch}.${fileName.split('.').toList().last}';

      final File file = File(
        strPath,
      );
      try {
        final Response<dynamic> response = await Dio().get(
          url,
          onReceiveProgress: (int received, int total) {
            if (total != -1) {
              showLog('${(received / total * 100).toStringAsFixed(0)}%');
            }
          },
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: true,
            receiveTimeout: 0,
          ),
        );
        final RandomAccessFile ref = file.openSync(mode: FileMode.write);
        ref.writeFromSync(response.data as List<int>);
        await ref.close();
      } catch (e) {
        showLog(e.toString());
      }
      return file;
    }
    return null;
  }

  static Future<void> openFile({
    required File file,
    required BuildContext context,
  }) async {
    try {
      await OpenFile.open(file.path);
    } catch (e) {
      showCenterFlash(
        message: e.toString(),
        context: context,
      );
    }
  }

  static Future<String> getDeviceId() async {
    final Map<String, dynamic> map = await initPlatformState();
    final String deviceId = Platform.isAndroid
        ? map['androidId'].toString()
        : map['identifierForVendor'].toString();
    return deviceId;
  }

  static Future<Map<String, dynamic>> initPlatformState() async {
    late Map<String, dynamic> deviceData;
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    return deviceData;
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.id,
      'systemFeatures': build.systemFeatures,
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  static int getDeviceOs() {
    final int os = Platform.isAndroid ? 1 : 0;
    return os;
  }

  static void showCenterFlash({
    required String message,
    FlashPosition position = FlashPosition.bottom,
    FlashBehavior style = FlashBehavior.floating,
    Color color = Palette.error,
    bool isIcon = false,
    int duration = 3,
    GlobalKey? key,
    required BuildContext context,
  }) {
    showFlash(
      context: context,
      duration: Duration(seconds: duration),
      builder: (BuildContext _, FlashController<dynamic> controller) {
        return Flash<dynamic>(
          controller: controller,
          position: FlashPosition.bottom,
          child: Wrap(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                color: color,
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    if (isIcon)
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.warning,
                          color: Palette.white,
                          size: 18,
                        ),
                      ),
                    Expanded(
                      child: TextLabel(
                        text: message,
                        textStyle: TextStyles.normal(color: Palette.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
