import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/data.dart';
import 'package:flutter_application_1/pages/detail.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Katalog Menu',
          style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),),
      ),
      body: ListView.builder(
        itemCount: menus.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailMenu(menu: menus[index]),
                ),
              );
            },
            leading: Image.network(menus[index].image,
            width: 60,
            height: 60,
            ),
            title:Text (menus[index].name),
            subtitle: Text ("Rp ${menus[index].price}"),
            trailing: Icon(Icons.arrow_forward_ios)
          );
        },
      ),
    );
  }
}