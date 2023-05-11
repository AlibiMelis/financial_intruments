import 'package:financial_instruments/service/lifecycle/lifecycle_watcher.dart';
import 'package:financial_instruments/service/stock/cubit/stock_cubit.dart';
import 'package:financial_instruments/service/stock/injections/repository_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LifecycleWatcherProvider extends StatelessWidget {
  final Widget child;

  const LifecycleWatcherProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<StockCubit>(
          create: (context) => StockCubitImpl(repository: StockRepositoryInject.stockRepository()),
        ),
      ],
      child: LifecycleWatcher(child: child),
    );
  }
}
