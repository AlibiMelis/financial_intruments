import 'package:financial_instruments/core/service/authentication/injection/dp_provider_di.dart';
import 'package:financial_instruments/core/service/authentication/repository/authentication_repo.dart';

class AuthenticationRepositoryInject {
  static AuthenticationRepository? _repository;

  AuthenticationRepositoryInject._();

  static AuthenticationRepository authenticationRepository() {
    return _repository ??= AuthenticationRepositoryImpl(dbProvider: AuthenticationDBProviderInject.authenticationDBProvider());
  }
}
