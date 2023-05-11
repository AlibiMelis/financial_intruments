import 'package:financial_instruments/service/stock/providers/api_provider.dart';

class StockApiProviderInject {
  static StockApiProvider? _stockApiProvider;

  StockApiProviderInject._();

  static StockApiProvider stockApiProvider() {
    return _stockApiProvider ??= StockApiProviderImpl();
  }
}
