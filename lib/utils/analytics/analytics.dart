import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:pet_grooming/main.dart';
import 'package:pet_grooming/utils/utility.dart';

class AnalyticsEvent {
  static FirebaseAnalytics analytics = MyAppState.analytics;

  static Future<void> setUserId({
    required FirebaseAnalytics firebaseAnalytics,
    required String id,
  }) {
    return firebaseAnalytics.setUserId(id: id);
  }

  static void logEvent({
    required Map<String, dynamic> logData,
    required String eventName,
  }) {
    Utility.showLog('EventName : $eventName');
    Utility.showLog('logData : $logData');

    analytics.logEvent(name: eventName, parameters: logData);
  }

  static void setCurrentScreen({
    required String screenName,
  }) {
    Utility.showLog('Current screenName : $screenName');

    analytics.setCurrentScreen(screenName: screenName);
  }
}
