import 'dart:ffi';

import 'package:get_storage/get_storage.dart';

class StorageUtil {
  final GetStorage  _storage;
  final String _userId = "userId";
  final String _hasLogin = "hasLogin";
  final String _token = "token";

  StorageUtil(this._storage);

  getUserId() => _storage.read(_userId);
  setUserId(String userId)async => await _storage.write(_userId, userId);

  hasLogin() => _storage.read(_hasLogin);
  setLogin(Bool loginState) => _storage.write(_hasLogin, loginState);

  getToken() => _storage.read(_token);
  setToken(String token) => _storage.write(_token, token);

  Future<void> removeAll() => _storage.erase();
}