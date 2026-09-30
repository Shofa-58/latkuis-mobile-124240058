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
    // Filter list menu yang isCart == true
    final cartItems = menus.where((item) => item.isCart).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang',
                  style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ))
      ),
      body: cartItems.isEmpty
          ? Center(
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
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        item.isCart = false; // Mengeluarkan item dari keranjang
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}