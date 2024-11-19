import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ecommerce_jopulee/models/product.dart';
import 'package:ecommerce_jopulee/widgets/left_drawer.dart';
import 'package:ecommerce_jopulee/cookie_request.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({super.key});

    @override
    ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    // TOD Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    
    var url = Uri.parse(
        'http://10.0.2.2//json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> listProduct = [];
    for (var d in data) {
        if (d != null) {
            listProduct.add(Product.fromJson(d));
        }
    }
    return listProduct;
}

@override
Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(request),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color.fromARGB(255, 231, 89, 167), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}