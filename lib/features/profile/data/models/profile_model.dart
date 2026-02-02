import '../../domain/entity/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.name,
    required super.email,
    super.address,
    super.image,
    super.password,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        name: json['name'],
        email: json['email'],
        address: json['address'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'address': address,
        'password': password,
        // 'image': ... handle image if needed
      };
}
