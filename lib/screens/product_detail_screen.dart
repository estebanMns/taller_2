import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final Function(Product) onAdd;

  const ProductDetailScreen({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header con imagen expandible
          SliverAppBar(
            expandedHeight: 350,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.grey[200],
                child: Center(child: Text(product.image, style: const TextStyle(fontSize: 120))),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      Text('\$${product.price}', style: const TextStyle(fontSize: 24, color: Color(0xFF1A237E), fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("Descripción", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(product.description, style: TextStyle(color: Colors.grey[600], height: 1.5, fontSize: 16)),
                  const SizedBox(height: 30),
                  const Text("Galería", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.gallery.length,
                      itemBuilder: (context, i) => Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(15)),
                        child: Center(child: Text(product.gallery[i], style: const TextStyle(fontSize: 30))),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100), // Espacio para el botón flotante
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(24),
        child: FilledButton(
          style: FilledButton.styleFrom(
            minimumSize: const Size(double.infinity, 60),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          ),
          onPressed: () {
            onAdd(product);
            Navigator.pop(context);
          },
          child: const Text("AÑADIR AL CARRITO", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}