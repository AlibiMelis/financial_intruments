import 'package:financial_instruments/service/stock/cubit/stock_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StockCubit, StockState>(
        builder: (context, state) {
          if (state is StockLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  for (final data in state.data.timeSeries.entries)
                    Text('${data.key} : ${data.value.close}')
                ],
              ),
            );
          }
          return const Text('Dashboard');
        },
      ),
    );
  }
}
