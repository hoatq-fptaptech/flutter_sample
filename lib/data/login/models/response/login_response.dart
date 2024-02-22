import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/login/entities/user_entitiy.dart';

// Project imports:

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends UserEntity {
  final String? userName;
  final String? email;
  final String? userPhone;
  final String? createdAt;

  const LoginResponse({
    this.userName,
    this.email,
    this.userPhone,
    this.createdAt,
  }) : super(
          phone: userPhone ?? '',
          name: userName ?? '',
        );

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
