import 'package:financial_instruments/core/service/watchlist/cubit/watchlist_cubit.dart';
import 'package:financial_instruments/core/utils/extensions.dart';
import 'package:financial_instruments/features/dashboard/views/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.bloc<WatchlistCubit>().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.bloc<WatchlistCubit>().fetchData(),
      child: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoaded) {
            final watchlist = state.watchlist;
            return HomePageView(watchlist: watchlist);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
