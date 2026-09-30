import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/data.dart';

class DetailMenu extends StatefulWidget {
  final Menu menu;

  const DetailMenu({super.key, required this.menu});

  @override
  State<DetailMenu> createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.menu.name,
                style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ))),
      body: Padding(
        padding: EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.menu.image, width: 340, height: 340),
            SizedBox(height: 10),
            Text(
              widget.menu.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(widget.menu.category),
            SizedBox(height: 16),
            Text(
              widget.menu.price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.green,
              ),
            ),
            Text(
              "Deskripsi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 6),
            Text(widget.menu.description),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    widget.menu.isCart = !widget.menu.isCart;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        widget.menu.isCart
                            ? '${widget.menu.name} ditambahkan ke keranjang'
                            : '${widget.menu.name} dihapus dari keranjang',
                      ),
                    ),
                  );
                },
                icon: Icon(
                  widget.menu.isCart
                      ? Icons.remove_shopping_cart
                      : Icons.add_shopping_cart,
                ),
                label: Text(
                  widget.menu.isCart
                      ? 'Hapus dari Keranjang'
                      : 'Tambah ke Keranjang',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      widget.menu.isCart ? Colors.red : Colors.blue,
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