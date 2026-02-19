class Product {
  final String id, name, image, description;
  final double price;
  final List<String> gallery; // Simulación de múltiples fotos

  Product({
    required this.id, 
    required this.name, 
    required this.price, 
    required this.image,
    required this.description,
    required this.gallery,
  });
}