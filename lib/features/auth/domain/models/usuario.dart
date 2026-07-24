class Usuario {
  final int id;
  final String username;
  final String email;
  final String firtsName;
  final String lastname;
  final String? image;

  const Usuario({
    required this.id,
    required this.username,
    required this.email,
    required this.firtsName,
    required this.lastname,
    this.image,
  });

  String get fullName => '$firtsName $lastname';

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      firtsName: json['firstName'] ?? '',
      lastname: json['lastName'] ?? '',
      image: json['image'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
