import 'package:financial_instruments/core/global/constants.dart';
import 'package:financial_instruments/core/service/storage/cache_storage.dart';
import 'package:financial_instruments/core/service/watchlist/model/watchlist.dart';

abstract class WatchlistDBProvider<T> {
  Future<T> fetchData();
  Future cacheData(T object);
}

class WatchlistDBProviderImpl extends WatchlistDBProvider<Watchlist?> {
  final CacheStorage cacheStorage;
  final String _key = 'watchlistKey'; 

  WatchlistDBProviderImpl({required this.cacheStorage});
  
  @override
  Future cacheData(Watchlist? object) async {
    await cacheStorage.cacheData(watchlistBox, _key, object);
  }

  @override
  Future<Watchlist?> fetchData() async {
    return await cacheStorage.fetchData(watchlistBox, _key) as Watchlist?;
  }

}
