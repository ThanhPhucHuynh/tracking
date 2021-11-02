import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tracking/utils/constants.dart';

class LocalStorage {
  final storage = new FlutterSecureStorage();

  Future<void> setToken(String token) async {
    await storage.write(key: Constants.TOKEN, value: token);
  }

  Future<String?> getLoginMethod() async {
    return storage.read(key: Constants.TOKEN);
  }

  Future<void> deleteUserData() async {
    await storage.delete(key: Constants.TOKEN);
  }
}
