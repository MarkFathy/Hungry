// core/domain/entities/user_entity.dart
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String token;
  final String? image;
  final String? phone;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.token,
    this.image,
    this.phone,
  });

  @override
  List<Object?> get props => [id, email, name, token, image, phone];
}
