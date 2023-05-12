import 'package:equatable/equatable.dart';
import 'package:financial_instruments/core/global/constants.dart';
import 'package:financial_instruments/core/service/stock/model/stock_data.dart';
import 'package:financial_instruments/core/service/stock/repository/stock_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stock_state.dart';

abstract class StockCubit extends Cubit<StockState> {
  StockCubit(super.state);

  Future<void> fetchStockData();
}

class StockCubitImpl extends StockCubit {
  final StockRepository repository;
  StockCubitImpl({required this.repository}) : super(StockInitial());

  @override
  Future<void> fetchStockData() async {
    
    final data = await repository.fetchStockData(symbols);
    if (data.object != null) {
      final stockData = data.object! as Map<String, StockData>;
      emit(StockLoaded(data: stockData));
    }
  }
}
