import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'product_detail_screen.dart';
import 'widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  final Function(Product) onAdd;

  HomeScreen({super.key, required this.onAdd});

  // Datos bien detallados
  final List<Product> _catalog = [
    Product(
      id: '1', name: 'MacBook Pro M3', price: 1999.0, image: '💻',
      description: 'El portátil más potente con el chip M3 Pro. Pantalla Liquid Retina XDR de 14 pulgadas y hasta 22 horas de autonomía.',
      gallery: ['💻', '🔌', '📦']
    ),
    Product(
      id: '2', name: 'iPhone 15 Pro', price: 999.0, image: '📱',
      description: 'Forjado en titanio. Chip A17 Pro. Botón de Acción personalizable. El sistema de cámara Pro más potente en un iPhone.',
      gallery: ['📱', '📸', '🔋']
    ),
    Product(
      id: '3', name: 'Sony WH-1000XM5', price: 399.0, image: '🎧',
      description: 'Cancelación de ruido líder en la industria. Calidad de sonido excepcional y llamadas ultra nítidas.',
      gallery: ['🎧', '📻', '👜']
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('ProStore', style: TextStyle(fontWeight: FontWeight.w900)),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = _catalog[index];
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => ProductDetailScreen(product: product, onAdd: onAdd)),
                    ),
                    child: ProductCard(product: product, onAdd: () => onAdd(product)),
                  );
                },
                childCount: _catalog.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}