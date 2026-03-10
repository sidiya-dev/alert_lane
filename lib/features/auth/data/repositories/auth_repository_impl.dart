import 'package:alert_lane/core/errors/failure.dart';
import 'package:alert_lane/core/errors/server_exception.dart';
import 'package:alert_lane/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:alert_lane/features/auth/domain/entities/user_entity.dart';
import 'package:alert_lane/features/auth/domain/repositories/auth_repository.dart';
import 'package:alert_lane/features/auth/domain/usecases/login_usecase.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});
  @override
  Future<Either<Failure, UserEntity>> login(LoginParams params) async {
    try {
      final res = await authRemoteDatasource.login(params);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
