
class Usuario {
  final String id;
  final String email;
  final String name;
  final String? photo;

  Usuario({
    required this.id,
    required this.email,
    required this.name,
    this.photo,
  });

}