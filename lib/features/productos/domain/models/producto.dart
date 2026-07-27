import 'package:proyecto_integrador_login/features/productos/domain/models/categoria.dart';

class Producto {
  final int id;
  final String nombre;
  final String descripcion;
  final double precio;
  final int stock;
  final String imageUrl;
  final int categoriaId;

  const Producto({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.stock,
    required this.imageUrl,
    required this.categoriaId,
  });
}
