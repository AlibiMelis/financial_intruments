part of 'watchlist_cubit.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object> get props => [];
}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final Watchlist watchlist;

  const WatchlistLoaded({required this.watchlist});

  @override
  List<Object> get props => [watchlist];
}
