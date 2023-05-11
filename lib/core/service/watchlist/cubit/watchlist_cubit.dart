import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:financial_instruments/core/service/watchlist/repository/watchlist_repo.dart';

part 'watchlist_state.dart';

abstract class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit(super.initialState);

  Future<void> fetchData();
}

class WatchlistCubitImpl extends WatchlistCubit {
  WatchlistCubitImpl({required this.repository}) : super(WatchlistInitial());

  final WatchlistRepository repository;
  
  @override
  Future<void> fetchData() async {
    final data = await repository.fetchWatchlistData('MQVNq3cwT9f6XbYqnpPU9xNodZ22');
    if (data.object != null) {
      print(data.object);
    }
  }
}
