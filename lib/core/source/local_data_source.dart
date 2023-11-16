// Dart imports:
import 'dart:convert';

// Flutter imports:

// Package imports:
import 'package:android_project/app/data/model/auth/user/user.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:android_project/core/source/encrypt_storage.dart';

abstract class LocalDataSource {
  User? get user;
  Future setUser(User? user);

  bool get isDark;
  Future setIsDark(bool flag);
  Future<void> clear();

  String? get email;
  Future setEmail(String? email);
}

@Environment(Environment.prod)
@Environment(Environment.dev)
@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl implements LocalDataSource {
  final EncryptStorage _getStorage;
  LocalDataSourceImpl(this._getStorage);

  @override
  Future<void> clear() async {
    setUser(null);
    return;
  }

  @override
  bool get isDark => _getStorage.read<bool>("isDark") == true;

  @override
  Future setIsDark(bool flag) {
    return _getStorage.write("isDark", flag);
  }

  @override
  Future setUser(User? user) {
    if (user != null) {
      return _getStorage.write("user", jsonEncode(user.toJson()));
    }
    return _getStorage.write("user", null);
  }

  @override
  User? get user {
    String? readData = _getStorage.read("user");
    if (readData != null) {
      Map<String, dynamic> json = jsonDecode(readData);
      return User.fromJson(json);
    }
    return null;
  }

  @override
  String? get email => _getStorage.read("email");

  @override
  Future setEmail(String? email) {
    return _getStorage.write("email", email);
  }
}

@Environment(Environment.test)
@LazySingleton(as: LocalDataSource)
class TestLocalDataSourceImpl implements LocalDataSource {
  @override
  Future<void> clear() async {
    return;
  }

  bool _isDark = false;
  @override
  bool get isDark => _isDark;

  @override
  Future setIsDark(bool flag) async {
    _isDark = flag;
  }

  User? _user;
  @override
  Future setUser(User? user) async {
    _user = user;
  }

  @override
  User? get user => _user;

  String? _email;
  @override
  String? get email => _email;

  @override
  Future setEmail(String? email) async {
    _email = email;
    return;
  }
}
