import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();

  @singleton
  HiveInterface get hiveInterface => Hive;

  @singleton
  GetStorage get getStorage => GetStorage();
}
