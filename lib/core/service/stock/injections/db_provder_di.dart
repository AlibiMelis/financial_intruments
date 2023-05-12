import 'package:financial_instruments/core/injection/injection.dart';
import 'package:financial_instruments/core/service/stock/providers/db_provider.dart';
import 'package:financial_instruments/core/service/storage/cache_storage.dart';

class StockDBProviderInject {
  static StockDBProvider? _stockDBProvider;

  StockDBProviderInject._();

  static StockDBProvider stockDBProvider() {
    return _stockDBProvider ??= StockDBProviderImpl(cacheStorage: getIt<CacheStorage>());
  }
}
