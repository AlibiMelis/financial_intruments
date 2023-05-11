import 'dart:developer';

import 'package:financial_instruments/core/global/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

abstract class CacheStorage<T> {
  Future<T> fetchData(String box, String key);
  Future cacheData(String box, String key, T object);
  Future removeData(String box, String key);
  Future clearCache({bool withDigitalTickets = false});
  Future close();
}

@Singleton(as: CacheStorage)
@preResolve
class CacheStorageImpl implements CacheStorage {
  final HiveInterface hive;
  final GetStorage getStorage;

  CacheStorageImpl._({required this.hive, required this.getStorage});

  @factoryMethod
  static Future<CacheStorage> init({
    required HiveInterface hive,
    required GetStorage getStorage,
  }) async {
    final instance = CacheStorageImpl._(hive: hive, getStorage: getStorage);
    await hive.initFlutter();
    return instance;
  }

  @override
  Future cacheData(String box, String key, dynamic object) async {
    try {
      final Box currentBox = await _openHiveBox(box);

      await currentBox.put(key, object);
    } on Exception catch (e, s) {
      log('ERROR: cannot put $key in cache storage. $e $s');
      rethrow;
    }
  }

  @override
  Future<dynamic> fetchData(String box, String key) async {
    try {
      final Box currentBox = await _openHiveBox(box);
      return await currentBox.get(key, defaultValue: null);
    } on Exception catch (e, s) {
      log('ERROR: cannot retreive $key from cache storage. $e $s');
      rethrow;
    }
  }

  @override
  Future removeData(String box, String key) async {
    try {
      final Box currentBox = await _openHiveBox(box);
      await currentBox.delete(key);
    } on Exception catch (e, s) {
      log('ERROR: cannot remove $key from cache storage. $e $s');

      rethrow;
    }
  }

  @override
  Future clearCache({bool withDigitalTickets = false}) async {
    try {
      for (final boxName in hiveBoxes) {
        await hive.deleteBoxFromDisk(boxName);
      }
    } on Exception catch (e, s) {
      log('ERROR: cannot clear all cache in cache storage. $e $s');
      rethrow;
    }
  }

  @override
  Future close() async {
    hive.close();
  }

  Future<Box> _openHiveBox(String box) async {
    if (hive.isBoxOpen(box)) {
      return hive.box(box);
    } else {
      try {
        final currentBox = await hive.openBox(box);
        return currentBox;
      } on Exception catch (e, s) {
        hive.deleteBoxFromDisk(box);
        log('ERROR: cannot open hive box $box in cache storage. $e $s');
        rethrow;
      }
    }
  }
}
