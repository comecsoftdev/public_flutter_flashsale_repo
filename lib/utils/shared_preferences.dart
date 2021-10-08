import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage{
  SharedPreferences? prefs;
  FlutterSecureStorage? secureStorage;

  Future init() async {
    if (this.prefs == null)
      this.prefs = await SharedPreferences.getInstance();
    if (this.secureStorage == null)
      this.secureStorage = new FlutterSecureStorage();

    return;
  }

  String? getString(key){
    return prefs!.getString(key) ?? null;
  }

  Future<bool> setString(String key, String? value) async {
    return prefs!.setString(key, value ?? '');
  }

  Future<String?> getSecureString(key) async{
    String? value = await secureStorage!.read(key: key);
    return value;
  }

  Future<void> setSecureString(String key, String? value) async {
    await secureStorage!.write(key: key, value: value);
  }

  bool getBool(key){
    return prefs!.getBool(key) ?? false;
  }

  Future<bool> setBool(String key, bool value) async {
    return prefs!.setBool(key, value);
  }
}