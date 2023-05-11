import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financial_instruments/core/service/model/app_response.dart';

abstract class WatchlistRepository {
  Future<AppResponse> fetchWatchlistData(String uid);
}

class WatchlistRepositoryImpl extends WatchlistRepository {
  final _firestore = FirebaseFirestore.instance.collection('watchlist');
  
  @override
  Future<AppResponse> fetchWatchlistData(String uid) async {
    final data = await _firestore.doc(uid).get();
    return AppResponse.success(data);
  }
}
