import 'package:shared_preferences/shared_preferences.dart';

class ServicePref {
  static SharedPreferences? _preferences;

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static Future clear() async => await _preferences!.clear();

  Future<bool> setStatus(bool login) async {
    return _preferences!.setBool('login', login);
  }

  bool getStatus() {
    return _preferences?.getBool('login') ?? false;
  }

  Future<bool> setToken(String token) async {
    return _preferences!.setString('token', token);
  }

  String getToken() {
    return _preferences?.getString('token') ?? '';
  }

  Future<bool> setCitizenship(String citizenship) async {
    return _preferences!.setString('citizenship', citizenship);
  }

  String getCitizenship() {
    return _preferences?.getString('citizenship') ?? '';
  }

  Future<bool> setFullname(String fullname) async {
    return _preferences!.setString('fullname', fullname);
  }

  String getFullname() {
    return _preferences?.getString('fullname') ?? '';
  }

  Future<bool> setUsername(String username) async {
    return _preferences!.setString('username', username);
  }

  String getUsername() {
    return _preferences?.getString('username') ?? '';
  }

  Future<bool> setCurrency(String currency) async {
    return _preferences!.setString('currency', currency);
  }

  String getCurrency() {
    return _preferences?.getString('currency') ?? '';
  }

  Future<bool> setBalance(int balance) async {
    return _preferences!.setInt('balance', balance);
  }

  int getBalance() {
    return _preferences?.getInt('balance') ?? 0;
  }

  Future<bool> setAccountId(int accountId) async {
    return _preferences!.setInt('accountId', accountId);
  }

  int getAccountId() {
    return _preferences?.getInt('accountId') ?? 0;
  }
}
