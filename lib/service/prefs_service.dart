import 'dart:convert';

import 'package:learn_shared_preferences/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefService {
  static storeName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('name', name);
  }

  static Future<String?> loadName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('name');
  }

  static Future<bool> removeName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove('name');
  }

  static storeUser(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    await preferences.setString('user', stringUser);
  }

  static Future<User?> loadUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? stringUser = preferences.getString('user');
    if (stringUser == null) return null;
    Map<String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove('user');
  }
}
