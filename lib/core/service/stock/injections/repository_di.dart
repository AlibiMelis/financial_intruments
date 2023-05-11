import 'package:financial_instruments/core/service/stock/injections/api_provider_di.dart';
import 'package:financial_instruments/core/service/stock/repository/stock_repo.dart';

class StockRepositoryInject {
  static StockRepository? _repository;

  StockRepositoryInject._();

  static StockRepository stockRepository() {
    return _repository ??= StockRepositoryImpl(apiProvider: StockApiProviderInject.stockApiProvider());
  }
}
