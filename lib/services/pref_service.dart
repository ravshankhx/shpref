import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shpref/model/account_model.dart';
import 'package:shpref/model/user_model.dart';

class Prefs {
  //name related
  static storeName(String name) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
  }
  static Future<String?> loadName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }
  static Future<bool?> removeName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("name");
  }

  //user related
  static storeUser(User user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    prefs.setString("user", stringUser);
  }
  static Future<User?> loadUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser= prefs.getString("user");
    if(stringUser == null||stringUser.isEmpty){
      return null;
    }
    Map<String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }
  static Future<bool?> removeUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }
  //account related
  static storeAccount(Account account) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringAccount = jsonEncode(account);
    prefs.setString("account", stringAccount);
  }
  static Future<User?> loadAccount() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringAccount= prefs.getString("account");
    if(stringAccount == null||stringAccount.isEmpty){
      return null;
    }
    Map<String, dynamic> map = jsonDecode(stringAccount);
    return User.fromJson(map);
  }
  static Future<bool?> removeAccount() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("account");
  }
}