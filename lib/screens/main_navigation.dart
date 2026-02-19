import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'home_screen.dart';
import 'cart_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Product> _cart = [];

  void _addToCart(Product product) {
    setState(() => _cart.add(product));
  }

  void _removeFromCart(int index) {
    setState(() => _cart.removeAt(index));
  }

  void _clearCart() {
    setState(() => _cart.clear());
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeScreen(onAdd: _addToCart),
      CartScreen(
        cartItems: _cart, 
        onRemove: _removeFromCart,
        onCheckoutComplete: _clearCart,
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) => setState(() => _currentIndex = index),
        destinations: [
          const NavigationDestination(icon: Icon(Icons.storefront), label: 'Tienda'),
          NavigationDestination(
            icon: Badge(
              label: Text(_cart.length.toString()),
              isLabelVisible: _cart.isNotEmpty,
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            label: 'Carrito',
          ),
        ],
      ),
    );
  }
}