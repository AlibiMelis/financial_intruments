import 'package:financial_instruments/core/global/keys.dart';
import 'package:flutter/widgets.dart' show Route;
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseNavigation extends Cubit<String?> {
  BaseNavigation(super.initialState);

  void navigateTo(String? page, {dynamic arguments});
  bool pop();
  void popEmit(Route<dynamic>? route, int index);
}

class NavigationService extends BaseNavigation {
  NavigationService() : super('dashboard');

  @override
  void navigateTo(String? page, {dynamic arguments}) {
    if (page?.isEmpty ?? true) return;
    Keys.customNavigationKey.currentState!.popUntil((route) {
      if (route.settings.name != page || route.settings.arguments != arguments) {
        switch (page) {
          case 'dashboard':
          case 'portfolio':
            if (Keys.customNavigationKey.currentState!.canPop()) {
              Keys.customNavigationKey.currentState!.popUntil((route) => route.isFirst);
            }
            break;
          default:
            Keys.customNavigationKey.currentState!.pushNamed(page!, arguments: arguments);
        }
        emit(page);
      }
      return true;
    });
  }

  @override
  bool pop() {
    if (Keys.customNavigationKey.currentState!.canPop()) {
      Keys.customNavigationKey.currentState!.pop();
      return true;
    }
    return false;
  }

  @override
  void popEmit(Route? route, int index) {
    if (route?.settings.name != null || route!.settings.name != null && route.settings.name!.isNotEmpty) {
      String? page = route!.settings.name;
      if (page == 'dashboard') {
        if (index == 2) {
          page = 'portfolio';
        }
      }
      emit(page);
    }
  }
}
