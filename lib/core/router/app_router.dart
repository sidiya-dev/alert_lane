import 'package:alert_lane/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:alert_lane/features/auth/presentation/pages/login_page.dart';
import 'package:alert_lane/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.login,
  debugLogDiagnostics: true,
  redirect: _globalRedirect,
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.register,
      builder: (context, state) => const RegisterPage(),
    ),
  ],
);

String? _globalRedirect(BuildContext context, GoRouterState state) {
  final authBloc = context.read<AuthBloc>();
  final isLoggedIn = authBloc.state is LoginSuccess;
  final isOnAuthRoute = state.matchedLocation.startsWith('/auth');

  if (!isLoggedIn && !isOnAuthRoute) {
    return AppRoutes.login;
  }
  return null;
}
