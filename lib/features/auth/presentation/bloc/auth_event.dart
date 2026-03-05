part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class UserLogin extends AuthEvent {
  final LoginParams params;

  UserLogin({required this.params});
}
