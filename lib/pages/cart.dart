import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // Kumpulkan item yang isCart == true pakai for loop biasa
    List<Menu> cartItems = [];
    for (var item in menus) {
      if (item.isCart == true) {
        cartItems.add(item);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text('Keranjang masih kosong'),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  leading: Image.network(item.image, width: 50, height: 50),
                  title: Text(item.name),
                  subtitle: Text('Rp ${item.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        item.isCart = false; // Mengubah status di list utama
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}