import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:financial_instruments/core/service/watchlist/repository/watchlist_repo.dart';

part 'watchlist_state.dart';

abstract class WatchlistCubit extends Cubit<WatchlistState> {
  WatchlistCubit(super.initialState);
}

class WatchlistCubitImpl extends WatchlistCubit {
  WatchlistCubitImpl({required this.repository}) : super(WatchlistInitial());

  final WatchlistRepository repository;
  
}
