import 'package:financial_instruments/core/injection/injection.dart';
import 'package:financial_instruments/core/service/authentication/providers/db_provider.dart';
import 'package:financial_instruments/core/service/storage/cache_storage.dart';

class AuthenticationDBProviderInject {
  static AuthenticationDBProvider? _repository;

  AuthenticationDBProviderInject._();

  static AuthenticationDBProvider authenticationDBProvider() {
    return _repository ??= AuthenticationDBProviderImpl(cacheStorage: getIt<CacheStorage>());
  }
}
