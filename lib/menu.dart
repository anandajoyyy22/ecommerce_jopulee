import 'package:flutter/material.dart';

// Class untuk merepresentasikan item ecommerce
class ShopItem {
  final String name; // Nama item
  final IconData icon; // Ikon yang terkait dengan item

  ShopItem(this.name, this.icon);
}

// Halaman utama aplikasi
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Daftar item yang akan ditampilkan
  final List<ShopItem> items = [
    ShopItem("Lihat Daftar Produk", Icons.checklist),
    ShopItem("Tambah Produk", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jopulee Gift',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context)
            .colorScheme
            .primary, // Warna latar belakang AppBar
      ),
      body: SingleChildScrollView(
        // Widget ini dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Jopulee Gift Store', // Judul ecommerce
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.pinkAccent, // Warna judul
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout untuk menampilkan tombol
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3, // Jumlah kolom dalam grid
                shrinkWrap:
                    true, // Mengatur ukuran grid agar sesuai dengan konten
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Class untuk merepresentasikan kartu tombol
class ShopCard extends StatelessWidget {
  final ShopItem item; // Item yang akan ditampilkan dalam kartu

  const ShopCard(this.item, {super.key}); // Constructor untuk ShopCard

  @override
  Widget build(BuildContext context) {
    // Mengatur warna berdasarkan nama item
    Color buttonColor;
    switch (item.name) {
      case "Lihat Daftar Produk":
        buttonColor = const Color.fromARGB(
            255, 225, 90, 135); // Warna untuk "Lihat Daftar Produk"
        break;
      case "Tambah Produk":
        buttonColor = Colors.grey; // Warna untuk "Tambah Produk"
        break;
      case "Logout":
        buttonColor = Colors.blueGrey; // Warna untuk "Logout"
        break;
      default:
        buttonColor = Colors.pinkAccent; // Warna default
    }

    return Material(
      color: buttonColor, // Mengatur warna sesuai dengan tombol
      child: InkWell(
        // Area yang dapat disentuh
        onTap: () {
          // Menampilkan SnackBar ketika tombol ditekan
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          padding: const EdgeInsets.all(8), // Padding dalam kartu
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon, // Ikon untuk item
                  color: Colors.white, // Warna ikon
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name, // Nama item
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white), // Warna teks
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
