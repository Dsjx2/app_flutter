class ProductoState {
  final int id;
  final String nombre;
  final String descripcion;
  final double precio;
  final int stock;
  final String imageUrl;
  final int categoriaId;

  ProductoState({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.stock,
    required this.imageUrl,
    required this.categoriaId,
  });
}