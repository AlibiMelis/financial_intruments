import 'package:financial_instruments/core/global/constants.dart';
import 'package:financial_instruments/core/service/mixins/api_provider_mixin.dart';
import 'package:financial_instruments/core/service/stock/model/stock_data.dart';

abstract class StockApiProvider<T> {
  Future<T> fetchData(String symbol);
}

class StockApiProviderImpl extends StockApiProvider<StockData> with ApiProviderMixin {
  @override
  Future<StockData> fetchData(String symbol) async {
    final data = await provideData(
      endPoint: aplhaEndpoint,
      param: {
        'function': alphaFunction,
        'interval': alphaInterval,
        'symbol': symbol,
        'apikey': alphaAPIKey,
      },
    ) as Map<String, dynamic>;
    return StockData.fromJson(data);
  }
}
