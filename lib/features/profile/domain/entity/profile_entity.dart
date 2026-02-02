class ProfileEntity {
  final String name;
  final String email;
  final String? image;
  final String? address;
  final String? password;

  const ProfileEntity( {
    required this.name,
    required this.email,
    this.image,
    this.address,
    this.password,
  });
}
