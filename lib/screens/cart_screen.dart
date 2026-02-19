import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;
  final Function(int) onRemove;
  final VoidCallback onCheckoutComplete;

  const CartScreen({
    super.key, 
    required this.cartItems, 
    required this.onRemove,
    required this.onCheckoutComplete,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double get _total => widget.cartItems.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi Carrito')),
      body: widget.cartItems.isEmpty
          ? const Center(child: Text('Tu carrito está vacío'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text(item.image)),
                        title: Text(item.name),
                        trailing: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => widget.onRemove(index),
                        ),
                      );
                    },
                  ),
                ),
                _buildSummaryCard(),
              ],
            ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('\$${_total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, color: Color(0xFF1A237E))),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton(
              onPressed: _processCheckout,
              child: const Text('CHECKOUT'),
            ),
          )
        ],
      ),
    );
  }

  void _processCheckout() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle_outline, size: 60, color: Colors.green),
            const SizedBox(height: 16),
            const Text('¿Confirmar Compra?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                widget.onCheckoutComplete();
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('¡Compra realizada!')));
              },
              child: const Text('CONFIRMAR'),
            )
          ],
        ),
      ),
    );
  }
}