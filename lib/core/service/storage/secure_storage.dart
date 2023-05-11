import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

abstract class SecureStorage {
  Future<String?> getData(String key);
  Future putData(String key, String? value);
  Future removeData(String key);
  Future removeAllData();
}

@Singleton(as: SecureStorage)
@preResolve
class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage storage;
  final GetStorage getStorage;

  SecureStorageImpl._({required this.storage, required this.getStorage});

  @factoryMethod
  static Future<SecureStorage> init(FlutterSecureStorage storage, GetStorage getStorage) async {
    final instance = SecureStorageImpl._(storage: storage, getStorage: getStorage);
    if (getStorage.read('firstRunSecure') ?? true) {
      await storage.deleteAll();
      getStorage.write('firstRunSecure', false);
    }
    return instance;
  }

  @override
  Future<String?> getData(String key) async {
    try {
      return await storage.read(key: key);
    } on Exception catch (e, s) {
      log('ERROR: cannot retreive $key from secure storage. $e $s');
    }
    return null;
  }

  @override
  Future putData(String key, String? value) async {
    try {
      await storage.write(key: key, value: value);
    } on Exception catch (e, s) {
      log('ERROR: cannot put $key in secure storage. $e $s');
    }
  }

  @override
  Future removeData(String key) async {
    try {
      await storage.delete(key: key);
    } on Exception catch (e, s) {
      log('ERROR: cannot remove $key from secure storage. $e $s');
    }
  }

  @override
  Future removeAllData() async {
    try {
      await storage.deleteAll();
    } on Exception catch (e, s) {
      log('ERROR: cannot delete all from secure storage. $e $s');
    }
  }
}
