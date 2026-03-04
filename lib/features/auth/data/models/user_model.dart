import 'package:alert_lane/features/auth/data/models/user_api_keys.dart';
import 'package:alert_lane/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[UserApiKeys.id],
      firstName: json["firstName"],
      lastName: json["lastName"],
      email: json["email"],
      phone: json["phone"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
    };
  }
}
