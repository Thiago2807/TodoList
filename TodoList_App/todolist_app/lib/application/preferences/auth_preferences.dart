import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/keys/keys.dart';
import '../dto/auth_output_user_dto.dart';

class AuthPreferences {
  static Future<SharedPreferences> _getInstance() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  static Future<bool> savedDataStringAsync({required String key, required String content}) async {
    SharedPreferences pref = await _getInstance();

    return await pref.setString(key, content);
  }

  static Future<String> getDataStringAsync(String key) async {
    SharedPreferences pref = await _getInstance();

    return pref.getString(key) ?? "";
  }

  // Function return object credentials user
  static Future<AuthOutputUserDTO> getUserObject() async {
    SharedPreferences pref = await _getInstance();

    Map<String, dynamic> dataMap = json.decode(pref.getString(credentialsUser) ?? "") as Map<String, dynamic>;

    return AuthOutputUserDTO.fromJson(dataMap);
  }

  static Future<bool> checkDataAsync(String key) async {
    SharedPreferences pref = await _getInstance();

    return pref.containsKey(key);
  }

  static Future<bool> deletePreferencesAsync(String key) async {
    SharedPreferences pref = await _getInstance();

    return await pref.remove(key);
  }
}