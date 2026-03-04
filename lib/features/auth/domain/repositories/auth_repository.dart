import 'package:alert_lane/core/errors/failure.dart';
import 'package:alert_lane/features/auth/domain/entities/user_entity.dart';
import 'package:alert_lane/features/auth/domain/usecases/login_usecase.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure,UserEntity>> login(LoginParams params);
}