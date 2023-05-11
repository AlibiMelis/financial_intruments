import 'dart:developer';

import 'package:financial_instruments/core/service/model/app_response.dart';
import 'package:financial_instruments/core/service/stock/providers/api_provider.dart';

abstract class StockRepository {
  Future<AppResponse> fetchStockData(String symbol);
}

class StockRepositoryImpl extends StockRepository {
  final StockApiProvider apiProvider;

  StockRepositoryImpl({required this.apiProvider});

  @override
  Future<AppResponse> fetchStockData(String symbol) async {
    try {
      final data = await apiProvider.fetchData(symbol);
      return AppResponse.success(data);
    } on Exception catch (e) {
      log(e.toString());
      return AppResponse.withError(e.toString());
    }
  }
}
