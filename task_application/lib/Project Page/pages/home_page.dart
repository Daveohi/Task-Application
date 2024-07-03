// import 'package:dave_stores/components/models/laptops.dart';
// import 'package:dave_stores/pages/checkoutscreen.dart';
// import 'package:dave_stores/pages/ordersuccesspage.dart';
// import 'package:dave_stores/pages/productpage.dart';
import 'package:flutter/material.dart';
import 'package:task_application/Project%20Page/components/models/laptops.dart';
import 'package:task_application/Project%20Page/pages/checkoutscreen.dart';
import 'package:task_application/Project%20Page/pages/ordersuccesspage.dart';
import 'package:task_application/Project%20Page/pages/productpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Laptops> _cartItems = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addToCart(Laptops laptop) {
    setState(() {
      _cartItems.add(laptop);
    });
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Added to cart'),
        content: Text('Check your cart to see the product'),
      ),
    );
  }

  void _removeFromCart(Laptops laptop) {
    setState(() {
      _cartItems.remove(laptop);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      ProductsScreen(
        addToCart: _addToCart,
      ),
      CheckoutScreen(
        cartItems: _cartItems,
        removeFromCart: _removeFromCart,
        onOrderSuccess: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OrderSuccessPage()),
          );
        }, clearCart: () { 
          setState(() {
            _cartItems.clear();
          });
         },
        
      ),
    ];

    return Scaffold(
      
      
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Checkout',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
