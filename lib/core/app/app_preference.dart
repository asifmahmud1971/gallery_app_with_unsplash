import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_dependency.dart';

const String prefsKeyLang = "prefsKeyLang";
const String prefsKeyIsUserLoggedIn = "prefsKeyIsUserLoggedIn";
const String prefsKeyUserLanguage = "prefsKeyUserLanguage";
const String prefsKeyAppDarkTheme = "prefsKeyAppDarkTheme";

const String prefsKeyUserInfo = "prefsKeyUserInfo";
const String prefsKeyUserToken = "prefsKeyUserToken";
const String prefsKeyAccessToken = "prefsKeyAccessToken";
const String prefsClientId = "prefsClientId";
const String prefsUid = "prefsUid";
const String timerDataKey = "timerData";
const String prefsClientInfo = "clientInfo";
const String prefsProjectInfo = "projectInfo";
const String prefsWorkType = "prefsWorkType";
const String prefsRememberMe = "prefsRememberMe";
const String prefsGps = "prefsGps";

const String prefsKeyDeviceToken = "prefsKeyDeviceToken";

@injectable
class AppPreferences {
  final sharedPreferences = instance<SharedPreferences>();

  /// set preferences data start here ///

  Future<void> setIsUserLoggedIn() async {
    sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

/*  Future<void> saveUserData(LoginResponse userData,
      {bool isLogin = true}) async {
    sharedPreferences.setString(prefsKeyUserInfo, json.encode(userData));
    if (isLogin) setIsUserLoggedIn();
  }*/

  Future<void> setUserAccessToken(String? accessToken) async {
    sharedPreferences.setString(prefsKeyAccessToken, accessToken ?? '');
  }

  Future<void> setUserClientId(String? clientId) async {
    sharedPreferences.setString(prefsClientId, clientId ?? '');
  }

  Future<void> setUserUid(String? uid) async {
    sharedPreferences.setString(prefsUid, uid ?? '');
  }

  Future<void> setGps({bool isGps = false}) async {
    sharedPreferences.setBool(prefsGps, isGps);
  }

  Future<void> setFCMToken(String? token) async {
    sharedPreferences.setString(prefsKeyDeviceToken, token ?? '');
  }

  Future<void> setLangKey(String? key) async {
    sharedPreferences.setString(prefsKeyLang, key ?? 'DE');
  }

  Future<void> setLanguage(String? language) async {
    sharedPreferences.setString(prefsKeyUserLanguage, language ?? 'German');
  }

  Future<void> setIsAppDarkTheme(bool isDark) async {
    sharedPreferences.setBool(prefsKeyAppDarkTheme, isDark);
  }

  Future<void> setIsRememberMe({bool isRemember = false}) async {
    sharedPreferences.setBool(prefsRememberMe, isRemember);
  }

  Future<void> removeUserData() async {
    sharedPreferences.remove(prefsKeyUserInfo);
    sharedPreferences.remove(prefsKeyLang);
    sharedPreferences.remove(prefsKeyUserLanguage);
    sharedPreferences.remove(prefsKeyUserToken);
    sharedPreferences.remove(prefsKeyAccessToken);
    sharedPreferences.remove(prefsClientId);
    sharedPreferences.remove(prefsUid);
    sharedPreferences.remove(timerDataKey);
    sharedPreferences.remove(prefsClientInfo);
    sharedPreferences.remove(prefsProjectInfo);
    sharedPreferences.remove(prefsWorkType);
    sharedPreferences.remove(prefsRememberMe);
    sharedPreferences.remove(prefsKeyDeviceToken);
  }

  /// set preferences data end here ///

  /// get preferences data start here ///

 /* LoginResponse getUserData() {
    return LoginResponse.fromJson(
        json.decode(sharedPreferences.getString(prefsKeyUserInfo)!));
  }*/

  Future<String> getUserAccessToken() async {
    return sharedPreferences.getString(prefsKeyAccessToken) ?? "";
  }

  Future<String> getUserClientId() async {
    return sharedPreferences.getString(prefsClientId) ?? "";
  }

  Future<String> getUserUid() async {
    return sharedPreferences.getString(prefsUid) ?? "";
  }

  Future<String> getDeviceToken() async {
    return sharedPreferences.getString(prefsKeyDeviceToken) ?? "";
  }

  String getLangKey() {
    return sharedPreferences.getString(prefsKeyLang) ?? 'DE';
  }

  String getLanguage() {
    return sharedPreferences.getString(prefsKeyUserLanguage) ?? 'German';
  }

  bool getIsRememberMe() {
    return sharedPreferences.getBool(prefsRememberMe) ?? false;
  }

  bool getGps() {
    return sharedPreferences.getBool(prefsGps) ?? false;
  }

  bool getIsAppDarkTheme() {
    return sharedPreferences.getBool(prefsKeyAppDarkTheme) ?? false;
  }

  Future<bool> isUserLoggedIn() async {
    return sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    await removeUserData();
    sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

  /// get preferences data end here ///
}
