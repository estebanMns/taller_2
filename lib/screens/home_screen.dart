import 'package:flutter/material.dart';
import '../models/product_model.dart';

class HomeScreen extends StatelessWidget {
  final Function(Product) onAdd;

  HomeScreen({super.key, required this.onAdd});

  final List<Product> _catalog = [
    Product(id: '1', name: 'MacBook Pro M3', price: 1999.0, image: '💻'),
    Product(id: '2', name: 'iPhone 15 Pro', price: 999.0, image: '📱'),
    Product(id: '3', name: 'Sony WH-1000XM5', price: 399.0, image: '🎧'),
    Product(id: '4', name: 'Magic Mouse', price: 79.0, image: '🖱️'),
    Product(id: '5', name: 'Apple Watch S9', price: 399.0, image: '⌚'),
    Product(id: '6', name: 'iPad Air', price: 599.0, image: '平板'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar.large(
            title: Text('ProStore', style: TextStyle(fontWeight: FontWeight.bold)),
            floating: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final p = _catalog[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(p.image, style: const TextStyle(fontSize: 40)),
                        const SizedBox(height: 10),
                        Text(p.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                        Text('\$${p.price}', style: const TextStyle(color: Colors.grey)),
                        const SizedBox(height: 10),
                        IconButton.filledTonal(
                          onPressed: () => onAdd(p),
                          icon: const Icon(Icons.add_shopping_cart),
                        )
                      ],
                    ),
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