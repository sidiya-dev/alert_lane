import 'package:alert_lane/core/errors/failure.dart';
import 'package:alert_lane/core/usecases/usecase.dart';
import 'package:alert_lane/features/auth/domain/entities/user_entity.dart';
import 'package:alert_lane/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class LoginUsecase implements Usecase<UserEntity, LoginParams> {
  final AuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await authRepository.login(params);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
