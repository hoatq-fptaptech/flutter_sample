import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String phone;

  const UserEntity({
    required this.name,
    required this.phone,
  });

  @override
  List<Object> get props => [
        name,
        phone,
      ];
}
