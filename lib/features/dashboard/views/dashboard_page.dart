import 'package:financial_instruments/core/global/app_color.dart';
import 'package:financial_instruments/core/global/keys.dart';
import 'package:financial_instruments/core/service/navigation/custom_observer.dart';
import 'package:financial_instruments/core/service/navigation/navigation_service.dart';
import 'package:financial_instruments/core/service/navigation/router_custom.dart';
import 'package:financial_instruments/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  final List<String> _tabs = ['dashboard', 'portfolio'];
  late TabController _tabController;
  late CustomObserver _observer;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _observer = CustomObserver()
      ..onPopped = (route, previousRoute) {
        context.bloc<BaseNavigation>().popEmit(previousRoute, _tabController.index);
      };

    context.bloc<BaseNavigation>().stream.listen((state) {
      if (_tabs.contains(state)) {
        _tabController.animateTo(_tabs.indexOf(state ?? ''), duration: const Duration(seconds: 1));
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Keys.customNavigationKey,
        initialRoute: 'dashboard',
        onGenerateRoute: RouterCustom.generateRoute,
        onGenerateInitialRoutes: (navigator, initialRoute) {
          return [navigator.widget.onGenerateRoute!(RouteSettings(name: 'dashboard', arguments: _tabController))!];
        },
        observers: [_observer],
      ),
      bottomNavigationBar: TabBar(
        onTap: (tab) {
          context.bloc<BaseNavigation>().navigateTo(_tabs[tab]);
        },
        controller: _tabController,
        tabs: [
          for (final tab in _tabs) Tab(text: tab.toUpperCase()),
        ],
        // labelStyle:
        labelColor: AppColor.bottomNavSelectedTab,
        unselectedLabelColor: AppColor.bottomNavUnselectedTab,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(
          // color:
        ),
      ),
    );
  }
}
