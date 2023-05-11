import 'package:financial_instruments/core/service/authentication/authentication.dart';
import 'package:financial_instruments/core/service/watchlist/cubit/watchlist_cubit.dart';
import 'package:financial_instruments/core/utils/extensions.dart';
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
    return BlocBuilder<BaseAuthentication, MainUser?>(
      builder: (context, mainUser) {
        return BlocBuilder<WatchlistCubit, WatchlistState>(
          builder: (context, state) {
            print(state);
            return Center(
              child: Text(mainUser?.uid ?? ''),
            );
          },
        );
      },
    );
  }
}
