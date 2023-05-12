import 'package:financial_instruments/core/global/constants.dart';
import 'package:financial_instruments/core/service/stock/model/stock_data.dart';
import 'package:financial_instruments/core/service/storage/cache_storage.dart';

abstract class StockDBProvider<T> {
  Future<T> fetchData();
  Future cacheData(T object);
}

class StockDBProviderImpl extends StockDBProvider<Map<String, StockData?>?> {
  final CacheStorage cacheStorage;
  final String _key = 'stockDataKey'; 

  StockDBProviderImpl({required this.cacheStorage});
  
  @override
  Future cacheData(Map<String, StockData?>? object) async {
    await cacheStorage.cacheData(authenticationBox, _key, object);
  }

  @override
  Future<Map<String, StockData?>?> fetchData() async {
    return await cacheStorage.fetchData(authenticationBox, _key) as Map<String, StockData?>?;
  }

}
