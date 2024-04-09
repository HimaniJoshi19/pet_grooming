import 'package:shared_preferences/shared_preferences.dart';

class AuthStorage {
  String isLoginPrefix = '_isLogin';
  String accessTokenPref = '_accessToken';

  Future<bool> getIsLogIn() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String key = isLoginPrefix;
    return pref.getBool(key) ?? false;
  }

  Future<void> putIsLogIn({bool isLogin = true}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool(isLoginPrefix, isLogin);
  }

  Future<void> putAccessTokenId({required String token}) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(accessTokenPref, token);
  }

  Future<String> getAccessTokenId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(accessTokenPref) ?? '';
  }

  Future<void> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(isLoginPrefix);
    await prefs.remove(accessTokenPref);
  }
}
