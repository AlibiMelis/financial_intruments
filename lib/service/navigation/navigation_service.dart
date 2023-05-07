import 'package:financial_instruments/global/keys.dart';
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
    // TODO: implement navigateTo
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
    // TODO: implement popEmit
  }
}
