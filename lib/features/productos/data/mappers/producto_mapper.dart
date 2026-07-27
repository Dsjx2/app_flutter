import 'package:proyecto_integrador_login/features/productos/domain/models/producto.dart';

class ProductoMapper {
  static Producto fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      nombre: json['nombre'],
      descripcion: json['descripcion'],
      precio: (json['precio'] as num).toDouble(),
      stock: json['stock'],
      imageUrl: json['imageUrl'],
      categoriaId: json['categoriaId'],
    );
  }

  static Map<String, dynamic> toJson(Producto producto) {
    return {
      'id': producto.id,
      'nombre': producto.nombre,
      'descripcion': producto.descripcion,
      'precio': producto.precio,
      'stock': producto.stock,
      'imageUrl': producto.imageUrl,
      'categoriaId': producto.categoriaId,
    };
  }

  static List<Producto> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductoMapper.fromJson(json)).toList();
  }
}