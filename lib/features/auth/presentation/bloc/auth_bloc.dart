import 'package:alert_lane/features/auth/domain/entities/user_entity.dart';
import 'package:alert_lane/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUsecase _loginUsecase;
  AuthBloc({required LoginUsecase loginUsecase})
    : _loginUsecase = loginUsecase,
      super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<UserLogin>((event, emit) async {
      emit(Loading());
      final res = await _loginUsecase.call(LoginParams(email: event.params.email, password: event.params.password));
      res.fold((l) => emit(LoginFailure(message: l.message)), (r) => emit(LoginSuccess(user: r)),);
    });
  }
}
