import 'package:flutter/material.dart';
import '../../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAdd;

  const ProductCard({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)],
      ),
      child: Column(
        children: [
          Expanded(
            child: Hero(
              tag: 'product-img-${product.id}',
              child: Center(child: Text(product.image, style: const TextStyle(fontSize: 50))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('\$${product.price}', style: const TextStyle(color: Colors.blueGrey)),
                const SizedBox(height: 8),
                IconButton.filledTonal(onPressed: onAdd, icon: const Icon(Icons.add)),
              ],
            ),
          )
        ],
      ),
    );
  }
}