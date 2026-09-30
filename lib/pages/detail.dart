import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/data.dart';

class DetailMenu extends StatefulWidget {
  final Menu menus;

  const DetailMenu({super.key, required this.menus});

  @override
  State<DetailMenu> createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> {
  late Menu menus; 

  @override
  void initState() {
    super.initState();
    menus = widget.menus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menus.name)),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(menus.image, width: 340, height: 250, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              menus.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(menus.category),
            const SizedBox(height: 16),
            Text(menus.price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Deskripsi",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 6),
            Text(menus.description),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    menus.isCart = !menus.isCart; // Mengubah status langsung
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        menus.isCart
                            ? '${menus.name} ditambahkan ke keranjang'
                            : '${menus.name} dihapus dari keranjang',
                      ),
                    ),
                  );
                },
                icon: Icon(
                  menus.isCart
                      ? Icons.remove_shopping_cart
                      : Icons.add_shopping_cart,
                ),
                label: Text(
                  menus.isCart
                      ? 'Hapus dari Keranjang'
                      : 'Tambah ke Keranjang',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      menus.isCart ? Colors.red : Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}