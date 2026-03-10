import 'package:alert_lane/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:alert_lane/features/auth/data/datasources/auth_remote_datasource_impl.dart';
import 'package:alert_lane/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:alert_lane/features/auth/domain/repositories/auth_repository.dart';
import 'package:alert_lane/features/auth/domain/usecases/login_usecase.dart';
import 'package:alert_lane/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator
    ..registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDatasource: serviceLocator()),
    )
    ..registerLazySingleton(
      () => LoginUsecase(authRepository: serviceLocator()),
    )
    ..registerLazySingleton(() => AuthBloc(loginUsecase: serviceLocator()));
}
