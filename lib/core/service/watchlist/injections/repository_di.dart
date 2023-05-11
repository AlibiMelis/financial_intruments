import 'package:financial_instruments/core/service/watchlist/repository/watchlist_repo.dart';

class WatchlistRepositoryInject {
  WatchlistRepositoryInject._();

  static WatchlistRepository? _watchlistRepository;

  static WatchlistRepository watchlistRepository() {
    return _watchlistRepository ??= WatchlistRepositoryImpl();
  }
}
