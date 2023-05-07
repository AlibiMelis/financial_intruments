import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocProviderExtension on BuildContext {
  T bloc<T extends BlocBase>() => BlocProvider.of<T>(this);
}
