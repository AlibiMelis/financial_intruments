import 'dart:developer';

import 'package:financial_instruments/core/service/model/app_response.dart';
import 'package:financial_instruments/core/service/stock/model/stock_data.dart';
import 'package:financial_instruments/core/service/stock/providers/api_provider.dart';
import 'package:financial_instruments/core/service/stock/providers/db_provider.dart';

abstract class StockRepository {
  Future<AppResponse> fetchStockData(List<String> symbols);
}

class StockRepositoryImpl extends StockRepository {
  final StockApiProvider apiProvider;
  final StockDBProvider dbProvider;

  StockRepositoryImpl({required this.apiProvider, required this.dbProvider});

  @override
  Future<AppResponse> fetchStockData(List<String> symbols) async {
    final stocksMap = <String, StockData>{};
    for (final symbol in symbols) {
      try {
        final data = await apiProvider.fetchData(symbol) as StockData;
        stocksMap[symbol] = data;
      } on Exception catch (e) {
        log(e.toString());
      }
    }
    if (stocksMap.isNotEmpty) {
      dbProvider.cacheData(stocksMap);
      return AppResponse.success(stocksMap);
    }
    return AppResponse.withError('Did not retreive any stock data');
  }
}
