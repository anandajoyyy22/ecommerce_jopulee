import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_jopulee/screens/login.dart';
import 'package:ecommerce_jopulee/screens/shoplist_form.dart';
import 'package:ecommerce_jopulee/screens/list_product.dart';


class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final messenger = ScaffoldMessenger.of(context); // Save ScaffoldMessenger

    return Material(
      color: Colors.pink,
      child: InkWell(
        onTap: () async {
          messenger
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text("Kamu telah menekan tombol ${item.name}!"),
            ));

          if (item.name == "Tambah Produk") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const ShopFormPage(),
              ),
            );
          } else if (item.name == "Lihat Produk") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductPage()),
            );
          } else if (item.name == "Logout") {
            final response = await request.logout(
              "http://localhost:8000/auth/logout/",
            );

            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              if (context.mounted) {
                // Check if widget is still mounted
                messenger.showSnackBar(
                  SnackBar(
                    content: Text("$message Sampai jumpa, $uname."),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              }
            } else {
              if (context.mounted) {
                // Check if widget is still mounted
                messenger.showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ),
                );
              }
            }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
