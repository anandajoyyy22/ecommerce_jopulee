import 'package:flutter/material.dart'; // Paket Flutter Material untuk menggunakan komponen UI
import 'package:ecommerce_jopulee/screens/menu.dart'; // menu.dart yang berisi definisi halaman utama aplikasi
import 'package:provider/provider.dart';
import 'package:ecommerce_jopulee/cookie_request.dart';


// func utama yang menjadi titik masuk aplikasi Flutter
void main() {
  // Menjalankan aplikasi dengan widget MyApp yang sudah dibungkus dengan Provider
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CookieRequest(), // Menyediakan CookieRequest
        ),
      ],
      child: const MyApp(), // MyApp sebagai child widget dari MultiProvider
    ),
  );
}

// class MyApp yang merupakan widget stateless
class MyApp extends StatelessWidget {
  // Konstruktor untuk MyApp, menggunakan key untuk widget
  const MyApp({super.key});

  // metode build untuk membangun UI dari MyApp
  @override
  Widget build(BuildContext context) {
    // mengembalikan widget MaterialApp yang merupakan root dari aplikasi
    return MaterialApp(
      // judul aplikasi yang akan ditampilkan di taskbar atau launcher
      title: 'JopuleeGift',
      // tema aplikasi
      theme: ThemeData(
        useMaterial3: true,
        // atur colorScheme dari swatch warna
        colorScheme: ColorScheme.fromSwatch(
          // warna pink sebagai primary swatch
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.pink[200], // tambah warna sekunder ke colorcheme
        ),
      ),
      // tetapkan home untuk aplikasi, yang merupakan halaman utama
      home: MyHomePage(), // Halaman utama menggunakan MyHomePage
    );
  }
}
