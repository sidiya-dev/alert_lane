import 'package:alert_lane/core/theme/app_theme.dart';
import 'package:alert_lane/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:alert_lane/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: LoginPage(),
      ),
    );
  }
}
