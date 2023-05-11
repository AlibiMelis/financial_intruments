import 'package:financial_instruments/service/stock/cubit/stock_cubit.dart';
import 'package:financial_instruments/utils/extensions.dart';
import 'package:flutter/material.dart';

class LifecycleWatcher extends StatefulWidget {
  final Widget child;
  const LifecycleWatcher({super.key, required this.child});

  @override
  State<LifecycleWatcher> createState() => _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher> {

  @override
  void initState() {
    super.initState();
    context.bloc<StockCubit>().fetchStockData();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
