// import 'package:dave_stores/components/models/laptops.dart';
import 'package:flutter/material.dart';
import 'package:task_application/Project%20Page/components/models/laptops.dart';
// import 'laptops.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Laptops> cartItems;
  final Function(Laptops) removeFromCart;
  final VoidCallback onOrderSuccess;
  final VoidCallback clearCart;

  const CheckoutScreen({
    super.key,
    required this.cartItems,
    required this.removeFromCart,
    required this.onOrderSuccess,
    required this.clearCart,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: widget.cartItems.isEmpty
          ? const Center(
              child: Text('Your cart is empty'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final laptop = widget.cartItems[index];
                      return Card(
                        child: ListTile(
                          leading:
                              Image.asset(laptop.image, width: 50, height: 50),
                          title: Text(laptop.name),
                          subtitle: Text(laptop.price),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_forever),
                            onPressed: () => widget.removeFromCart(laptop),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.clearCart();
                      return widget.onOrderSuccess();
                      
                    },
                    child: const Text('Proceed to Place Order'),
                  ),
                ),
              ],
            ),
    );
  }
}
