import 'package:flutter/material.dart';

class CustomObserver extends NavigatorObserver {
  Function(Route<dynamic> route, Route<dynamic>? previousRoute)? onPopped;

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (onPopped != null) {
      final fn = onPopped!;
      fn(route, previousRoute);
    }
  }
}
