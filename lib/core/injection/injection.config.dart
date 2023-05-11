// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:financial_instruments/core/injection/register_module.dart'
    as _i8;
import 'package:financial_instruments/core/service/storage/cache_storage.dart'
    as _i7;
import 'package:financial_instruments/core/service/storage/secure_storage.dart'
    as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i4;
import 'package:hive_flutter/hive_flutter.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.FlutterSecureStorage>(registerModule.flutterSecureStorage);
    gh.singleton<_i4.GetStorage>(registerModule.getStorage);
    gh.singleton<_i5.HiveInterface>(registerModule.hiveInterface);
    await gh.singletonAsync<_i6.SecureStorage>(
      () => _i6.SecureStorageImpl.init(
        gh<_i3.FlutterSecureStorage>(),
        gh<_i4.GetStorage>(),
      ),
      preResolve: true,
    );
    await gh.singletonAsync<_i7.CacheStorage<dynamic>>(
      () => _i7.CacheStorageImpl.init(
        hive: gh<_i5.HiveInterface>(),
        getStorage: gh<_i4.GetStorage>(),
      ),
      preResolve: true,
    );
    return this;
  }
}

class _$RegisterModule extends _i8.RegisterModule {}
