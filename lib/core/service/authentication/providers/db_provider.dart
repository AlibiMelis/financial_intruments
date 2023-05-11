import 'package:financial_instruments/core/global/constants.dart';
import 'package:financial_instruments/core/service/authentication/authentication.dart';
import 'package:financial_instruments/core/service/storage/cache_storage.dart';

abstract class AuthenticationDBProvider<T> {
  Future<T> fetchData();
  Future cacheData(T object);
}

class AuthenticationDBProviderImpl extends AuthenticationDBProvider<MainUser?> {
  final CacheStorage cacheStorage;
  final String _key = 'mainUserKey'; 

  AuthenticationDBProviderImpl({required this.cacheStorage});
  
  @override
  Future cacheData(MainUser? object) async {
    await cacheStorage.cacheData(authenticationBox, _key, object);
  }

  @override
  Future<MainUser?> fetchData() async {
    return await cacheStorage.fetchData(authenticationBox, _key) as MainUser?;
  }

}
