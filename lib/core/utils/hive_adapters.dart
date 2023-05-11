import 'package:financial_instruments/core/injection/injection.dart';
import 'package:financial_instruments/core/service/authentication/model/main_user.dart';
import 'package:financial_instruments/core/service/stock/model/stock_data.dart';
import 'package:financial_instruments/core/service/stock/model/stock_data_point.dart';
import 'package:financial_instruments/core/service/stock/model/stock_meta_data.dart';
import 'package:financial_instruments/core/service/watchlist/model/watchlist.dart';
import 'package:hive_flutter/hive_flutter.dart';

void registerAdapters() {
  getIt<HiveInterface>()
    ..registerAdapter(MainUserAdapter())
    ..registerAdapter(StockDataAdapter())
    ..registerAdapter(StockMetaDataAdapter())
    ..registerAdapter(StockDataPointAdapter())
    ..registerAdapter(WatchlistAdapter());
}
