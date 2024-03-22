

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vtuberlist/core/utils/injections.dart';

class APPSharePreferences {
  APPSharePreferences._privateConstructor();

  static final APPSharePreferences _instance = APPSharePreferences._privateConstructor();

  factory APPSharePreferences() {
    return _instance;
  }

  final String _tokenKey = "_tokenKey";

  saveToken(String token) {
    s1<SharedPreferences>().setString(_tokenKey, token);
  }

  String getToken() {
    return s1<SharedPreferences>().getString(_tokenKey) ?? "";
  }
}