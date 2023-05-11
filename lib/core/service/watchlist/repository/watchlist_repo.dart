import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_instruments/core/service/model/app_response.dart';
import 'package:financial_instruments/core/service/watchlist/model/watchlist.dart';
import 'package:financial_instruments/core/service/watchlist/providers/db_provider.dart';

abstract class WatchlistRepository {
  Future<AppResponse> fetchFromApi(String uid);
  Future<AppResponse> fetchFromCache();
}

class WatchlistRepositoryImpl extends WatchlistRepository {
  final _firestore = FirebaseFirestore.instance.collection('watchlist');
  final WatchlistDBProvider dbProvider;

  WatchlistRepositoryImpl({required this.dbProvider});

  @override
  Future<AppResponse> fetchFromApi(String uid) async {
    try {
      final snapshot = await _firestore.doc(uid).get();
      if (snapshot.exists) {
        final data = snapshot.data() ?? {};
        final watchlist = Watchlist.fromJson(data);
        dbProvider.cacheData(watchlist);
        return AppResponse.success(watchlist);
      }
      return AppResponse.success(null);
    } on Exception catch (e, s) {
      log("ERROR: Was not able to load watchlist from api. $e, $s");
      return AppResponse.withError(e.toString());
    }
  }

  @override
  Future<AppResponse> fetchFromCache() async {
    try {
      final data = await dbProvider.fetchData();
      return AppResponse.success(data);
    } on Exception catch (e, s) {
      log("ERROR: Was not able to load watchlist from cache. $e, $s");
      return AppResponse.withError(e.toString());
    }
  }
}
