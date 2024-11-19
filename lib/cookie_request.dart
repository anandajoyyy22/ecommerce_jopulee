// ecommerce_jopulee/cookie_request.dart

import 'package:flutter/material.dart';

class CookieRequest extends ChangeNotifier {
  String _cookie = "";

  String get cookie => _cookie;

  set cookie(String newCookie) {
    _cookie = newCookie;
    notifyListeners(); // Memberi tahu widget yang mendengarkan untuk memperbarui UI
  }

  // Misalnya, fungsi ini untuk mengirim request HTTP atau operasi lain
  Future<void> fetchCookieData() async {
    // Logika untuk mendapatkan atau mengatur cookie
    _cookie = "new_cookie_value";
    notifyListeners();
  }
}
