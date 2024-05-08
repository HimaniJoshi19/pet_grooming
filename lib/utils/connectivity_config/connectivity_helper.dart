import 'dart:async';
import 'dart:isolate';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:pet_grooming/utils/connectivity_config/connectivity_config_string.dart';
import 'package:pet_grooming/utils/utility.dart';

class ConnectivityHelper {
  final StreamController<bool> streamController = StreamController<bool>();

  /*
    checkConnectivity() is used to get the connectionStatus once when call this
    method. It will return not nullable boolean value.

    onlyCheckConnectivity is used for when you don't want to make api call for
    check the internet connection. Default value of this parameter is false.
   */

  Future<bool> checkConnectivity({
    bool onlyCheckConnectivity = false,
    Connectivity? connectivity,
  }) async {
    try {
      connectivity ??= Connectivity();
      final List<ConnectivityResult> connectivityResult =
          await connectivity.checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        if (onlyCheckConnectivity) {
          return true;
        } else {
          final bool isConnected = await pingUrl();
          return isConnected;
        }
      } else {
        return false;
      }
    } catch (e) {
      Utility.showLog('Error in connectivity check : $e');
      return false;
    }
  }

  /*
    checkConnectionStream() is used to get the connectionStatus real-time,
    It return a stream. You can call the listener method of the stream to
    get the live update of the internet connection.

    onlyCheckConnectivity is used for when you don't want to make api call for
    check the internet connection. Default value of this parameter is false.
   */
  Stream<bool> checkConnectionStream({
    bool onlyCheckConnectivity = false,
  }) async* {
    bool isConnected = false;
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> connectivityResult) async {
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        if (onlyCheckConnectivity) {
          streamController.add(true);
        } else {
          isConnected = await pingUrl();
          streamController.add(isConnected);
        }
      } else {
        isConnected = false;
        streamController.add(isConnected);
      }
    });

    yield* streamController.stream;
  }

  /*Future<bool> pingUrl() async {
    try {
      late http.Response response;
      response = await http
          .get(Uri.parse(ConnectivityConfigString.checkInternetUrl))
          .timeout(
            const Duration(seconds: 10),
          );
      if (response.statusCode < 200 || response.statusCode > 299) {
        return false;
      }
      return true;
    } catch (e) {
      showLog('Error in check connectivity: $e');
      return false;
    }
  }*/

  Future<bool> pingUrl() async {
    //Main Receive port for initially call the async method
    final ReceivePort mainReceiverPort = ReceivePort();
    await Isolate.spawn(_postMainReceiveResult, mainReceiverPort.sendPort);

    // Send port for communicate to pass params
    final SendPort argumentSenderPort =
        await mainReceiverPort.first as SendPort;

    // Receiver to get main response of api call
    final ReceivePort apiResponseReceiverPort = ReceivePort();

    argumentSenderPort.send(
      <String, dynamic>{
        'port': apiResponseReceiverPort.sendPort,
      },
    );

    final bool resultModel = await apiResponseReceiverPort.first as bool;
    return resultModel;
  }

  static Future<void> _postMainReceiveResult(SendPort mainSenderPort) async {
    // Receiver point to read argument
    final ReceivePort argumentReceiverPort = ReceivePort();

    // Main sender port
    mainSenderPort.send(argumentReceiverPort.sendPort);

    final Map<String, dynamic> args =
        await argumentReceiverPort.first as Map<String, dynamic>;

    final SendPort apiResponseSenderPort = args['port'] as SendPort;
    bool result = false;
    try {
      final Response<dynamic> response = await Dio()
          .get(
            ConnectivityConfigString.checkInternetUrl,
          )
          .timeout(
            const Duration(seconds: 10),
          );

      if (response.statusCode! < 200 || response.statusCode! > 299) {
        result = false;
      }
      result = true;
    } catch (e) {
      Utility.showLog('Error in InternetCheck $e');
      result = false;
    }

    apiResponseSenderPort.send(result);
  }

  /*
  disposeStream() is used to close the running stream.
   */
  void disposeStream() {
    streamController.close();
  }
}
