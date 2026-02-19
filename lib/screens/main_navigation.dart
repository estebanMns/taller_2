import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'home_screen.dart';
import 'cart_screen.dart'; // Ahora importará la clase correcta

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Product> _cart = [];

  void _addToCart(Product p) {
    setState(() => _cart.add(p));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${p.name} agregado"), backgroundColor: const Color(0xFFFF4B4B)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomeScreen(onAdd: _addToCart),
      CartScreen(
        cartItems: _cart,
        onRemove: (index) => setState(() => _cart.removeAt(index)),
        onCheckoutComplete: () => setState(() => _cart.clear()),
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        selectedItemColor: const Color(0xFFFF4B4B),
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Badge(label: Text("${_cart.length}"), child: const Icon(Icons.shopping_cart)), 
            label: 'Carrito'
          ),
        ],
      ),
    );
  }
}