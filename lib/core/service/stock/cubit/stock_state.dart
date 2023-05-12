part of 'stock_cubit.dart';

abstract class StockState extends Equatable {
  const StockState();

  @override
  List<Object> get props => [];
}

class StockInitial extends StockState {}

class StockLoaded extends StockState {
  final Map<String, StockData> data;

  const StockLoaded({required this.data});

  @override
  List<Object> get props => [data];
}
