import 'package:proyecto_integrador_login/features/productos/domain/models/producto.dart';

class ProductoState {
  final List<Producto> productos;
  final bool isLoading;
  final String? error;
  final String? productoQuery;

  ProductoState({
    required this.productos,
    required this.isLoading,
    required this.error,
    required this.productoQuery,
  });
}
