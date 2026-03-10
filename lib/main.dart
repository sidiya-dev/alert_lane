import 'package:alert_lane/app.dart';
import 'package:alert_lane/dependencies.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await initDependencies();
  runApp(const App());
}
