import 'package:financial_instruments/core/injection/injection.dart';
import 'package:financial_instruments/core/service/storage/cache_storage.dart';
import 'package:financial_instruments/core/service/watchlist/providers/db_provider.dart';

class WatchlistDBProviderInject {
  WatchlistDBProviderInject._();

  static WatchlistDBProvider? _watchlistDBProvider;

  static WatchlistDBProvider watchlistDBProvider() {
    return _watchlistDBProvider ??= WatchlistDBProviderImpl(cacheStorage: getIt<CacheStorage>());
  }
}
