import 'package:equatable/equatable.dart';
import 'package:financial_instruments/service/stock/model/stock_data.dart';
import 'package:financial_instruments/service/stock/repository/stock_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stock_state.dart';

abstract class StockCubit extends Cubit<StockState> {
  StockCubit(super.state);
}

class StockCubitImpl extends StockCubit {
  final StockRepository repository;
  StockCubitImpl({required this.repository}) : super(StockInitial());


  Future<void> fetchStockData() async {
    const symbol = 'IBM';
    final data = await repository.fetchStockData(symbol);
    if (data.object != null) {
      final stockData = data.object! as StockData;
      emit(StockLoaded(data: stockData));
    }
  }
}