import 'package:financial_instruments/core/service/mixins/api_provider_mixin.dart';
import 'package:financial_instruments/core/service/watchlist/model/watchlist.dart';

abstract class WatchlistApiProvider<T> {
  Future<T> fetchData();
}

class WatchlistApiProviderImpl extends WatchlistApiProvider<Watchlist> with ApiProviderMixin {
  @override
  Future<Watchlist> fetchData() async {
    return Watchlist();
  }
}
