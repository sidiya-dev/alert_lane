part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {
  final UserEntity user;

  LoginSuccess({required this.user});
}

class LoginFailure extends AuthState {
  final String message;

  LoginFailure({required this.message});
}

class Loading extends AuthState {}
