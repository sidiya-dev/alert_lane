import 'package:alert_lane/features/auth/data/models/user_model.dart';
import 'package:alert_lane/features/auth/domain/usecases/login_usecase.dart';

abstract interface class AuthRemoteDatasource {
  Future<UserModel> login(LoginParams params);
}