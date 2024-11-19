import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:ecommerce_jopulee/screens/menu.dart';
import 'package:ecommerce_jopulee/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _category = "";
  int _stock = 0;
  String _imageUrl = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Form Add Product')),
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nama Produk
              _buildTextField(
                label: "Product Name",
                hint: "Product Name",
                onChanged: (value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name cannot be empty!";
                  }
                  return null;
                },
              ),
              // Harga
              _buildTextField(
                label: "Price",
                hint: "Price",
                onChanged: (value) {
                  setState(() {
                    _price = int.tryParse(value!) ?? 0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Price cannot be empty!";
                  }
                  if (int.tryParse(value) == null) {
                    return "Price must be a number!";
                  }
                  return null;
                },
              ),
              // Deskripsi
              _buildTextField(
                label: "Description",
                hint: "Description",
                onChanged: (value) {
                  setState(() {
                    _description = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description cannot be empty!";
                  }
                  return null;
                },
              ),
              // Kategori
              _buildTextField(
                label: "Category",
                hint: "Category",
                onChanged: (value) {
                  setState(() {
                    _category = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Category cannot be empty!";
                  }
                  return null;
                },
              ),
              // Stok
              _buildTextField(
                label: "Stock",
                hint: "Stock",
                onChanged: (value) {
                  setState(() {
                    _stock = int.tryParse(value!) ?? 0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Stock cannot be empty!";
                  }
                  if (int.tryParse(value) == null || int.tryParse(value)! < 0) {
                    return "Stock must be a positive number!";
                  }
                  return null;
                },
              ),
              // URL Gambar
              _buildTextField(
                label: "Image URL",
                hint: "Image URL",
                onChanged: (value) {
                  setState(() {
                    _imageUrl = value!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Image URL cannot be empty!";
                  }
                  return null;
                },
              ),
              // Tombol Save
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.pink),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Kirim ke Django dan tunggu respons
                        final response = await request.postJson(
                          "http://127.0.0.1:8000/create-flutter/",
                          jsonEncode(<String, dynamic>{
                            'name': _name,
                            'price': _price.toString(),
                            'description': _description,
                            'category': _category,
                            'stock': _stock,
                            'image': _imageUrl,
                          }),
                        );

                        // Mengecek apakah context masih valid sebelum melakukan perubahan UI
                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Produk baru berhasil disimpan!"),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Terdapat kesalahan, silakan coba lagi."),
                              ),
                            );
                          }
                        }
                      }
                    },
                    child: const Text(
                      "Add Product",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun TextFormField agar lebih modular
  Widget _buildTextField({
    required String label,
    required String hint,
    required Function(String?) onChanged,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
