import 'package:financial_instruments/app.dart';
import 'package:financial_instruments/core/injection/injection.dart';
import 'package:financial_instruments/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();
  runApp(const App());
}
