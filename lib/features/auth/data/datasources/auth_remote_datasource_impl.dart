import 'package:alert_lane/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:alert_lane/features/auth/data/models/user_model.dart';
import 'package:alert_lane/features/auth/domain/usecases/login_usecase.dart';

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  @override
  Future<UserModel> login(LoginParams params) async {
    await Future.delayed(Duration(seconds: 4));
    return UserModel(
      id: "ui1297i",
      firstName: "DrS",
      lastName: "Software",
      email: "drs@gmail.com",
      phone: "36419515",
    );
  }
}
