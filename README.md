# Tugas 7 PBP
# JopuleeGift README

## 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

**Stateless Widget** adalah widget yang tidak memiliki state (keadaan) yang dapat berubah. Widget ini tidak menyimpan informasi yang bisa diperbarui selama siklus hidup aplikasi. Contoh penggunaannya adalah widget yang selalu menampilkan data statis, seperti `Text` atau `Icon`.

**Stateful Widget** adalah widget yang memiliki state yang dapat berubah seiring waktu. Widget ini dapat memperbarui tampilannya ketika state-nya berubah, misalnya saat pengguna berinteraksi dengan aplikasi. Contoh penggunaan `StatefulWidget` adalah form input, di mana pengguna dapat mengubah nilai yang diinput.

**Perbedaan**:
- Stateless widget tidak dapat mengubah tampilannya setelah dibangun, sedangkan stateful widget dapat memperbarui tampilan saat state-nya berubah.
- Stateless widget lebih sederhana dan lebih cepat karena tidak perlu mengelola state.

## 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

Widget yang digunakan pada proyek ini adalah:
- **MaterialApp**: Widget yang menyediakan struktur dasar untuk aplikasi dengan desain material. Mengatur tema, judul, dan halaman utama.
- **Scaffold**: Menyediakan kerangka dasar untuk tampilan aplikasi dengan app bar, body, drawer, dan floating action button.
- **AppBar**: Menyediakan bar di bagian atas aplikasi, tempat untuk menampilkan judul dan ikon.
- **SingleChildScrollView**: Membungkus konten yang dapat digulir, memungkinkan tampilan konten yang lebih besar dari layar.
- **Column**: Widget yang menempatkan children secara vertikal.
- **Padding**: Memberikan ruang kosong di sekeliling widget.
- **GridView**: Widget yang menampilkan item dalam format grid, memungkinkan tata letak yang fleksibel.
- **Material**: Menghasilkan efek material seperti bayangan dan pengelompokan konten.
- **InkWell**: Menangani interaksi sentuhan dengan memberikan efek ripple saat ditekan.
- **SnackBar**: Menampilkan pesan pendek di bagian bawah layar.

## 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

`setState()` adalah metode yang digunakan dalam `StatefulWidget` untuk memberi tahu Flutter bahwa ada perubahan dalam state yang memerlukan pembaruan tampilan widget. Ketika `setState()` dipanggil, Flutter akan memanggil kembali metode `build()` dari widget yang memerlukan pembaruan.

**Variabel yang Terpengaruh**:
- Hanya variabel yang dideklarasikan dalam kelas yang merupakan `State` dari `StatefulWidget` yang akan diperbarui dan memengaruhi tampilan saat `setState()` dipanggil. Contoh variabel ini bisa berupa boolean, integer, list, atau objek yang menyimpan informasi status saat ini.

## 4. Pelaskan perbedaan antara const dengan final.

- **`const`**: Digunakan untuk mendeklarasikan variabel dengan nilai konstan pada waktu kompilasi. Nilai yang ditetapkan menggunakan `const` tidak dapat diubah, dan objek yang dibuat adalah instans yang sama (immutable) setiap kali.
  
- **`final`**: Digunakan untuk mendeklarasikan variabel yang hanya dapat diatur satu kali, tetapi nilainya dapat ditetapkan pada waktu runtime. Variabel `final` dapat memiliki nilai yang ditentukan di luar waktu kompilasi dan objek yang dihasilkan tidak harus sama setiap kali.

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

Berikut adalah penjelasan mengenai implementasi checklist untuk mengerjakan tugas 7:

**A. Membuat file Main**
### Import Statements
```dart
import 'package:flutter/material.dart'; // Paket Flutter Material untuk menggunakan komponen UI
import 'package:ecommerce_jopulee/menu.dart'; // menu.dart yang berisi definisi halaman utama aplikasi
```
- **Import Flutter Material**: Kode ini mengimpor paket `material.dart` dari Flutter, yang memungkinkan penggunaan berbagai komponen UI yang mengikuti desain material. 
- **Import menu.dart**: Mengimpor file `menu.dart`, yang mungkin berisi definisi dan implementasi halaman utama dari aplikasi ini.

### Fungsi `main`
```dart
// func utama yang menjadi titik masuk aplikasi Flutter
void main() {
  // Menjalankan aplikasi dengan widget MyApp
  runApp(const MyApp());
}
```
- **Fungsi Main**: Fungsi `main()` adalah titik masuk dari aplikasi Flutter. 
- **Menjalankan Aplikasi**: Memanggil `runApp()` untuk menjalankan aplikasi dan menampilkan widget `MyApp` sebagai widget utama.

### Kelas `MyApp`
```dart
// class MyApp yang merupakan widget stateless
class MyApp extends StatelessWidget {
  // Konstruktor untuk MyApp, menggunakan key untuk widget
  const MyApp({super.key});
```
- **Stateless Widget**: `MyApp` adalah sebuah `StatelessWidget`, yang berarti widget ini tidak memiliki state yang berubah. 
- **Konstruktor**: Konstruktor `MyApp` menerima parameter `key`, yang berguna untuk pengelolaan state dan identifikasi widget dalam hirarki widget.

### Metode `build`
```dart
  // metode build untuk membangun UI dari MyApp
  @override
  Widget build(BuildContext context) {
    // mengembalikan widget MaterialApp yang merupakan root dari aplikasi
    return MaterialApp(
```
- **Metode Build**: Metode ini dipanggil untuk membangun UI widget. 
- **MaterialApp**: Mengembalikan widget `MaterialApp`, yang berfungsi sebagai root dari aplikasi Flutter dan menyediakan struktur serta tema yang diperlukan untuk seluruh aplikasi.

### Properti `MaterialApp`
```dart
      // judul aplikasi yang akan ditampilkan di taskbar atau launcher
      title: 'JopuleeGift',
```
- **Judul Aplikasi**: Mengatur judul aplikasi yang akan ditampilkan di taskbar atau launcher perangkat.

### Tema Aplikasi
```dart
      // tema aplikasi
      theme: ThemeData(
        // atur colorScheme dari swatch warna
        colorScheme: ColorScheme.fromSwatch(
          //  warna pink sebagai primary swatch
          primarySwatch: Colors.pink,
        ).copyWith(
            secondary:
                Colors.pink[200]), // tambah warna sekunder ke colorScheme
      ),
```
- **Tema Aplikasi**: Mengatur tema aplikasi menggunakan `ThemeData`. 
- **Color Scheme**: Mengatur `colorScheme` menggunakan `ColorScheme.fromSwatch`, dengan warna utama ditetapkan sebagai pink dan warna sekunder sebagai warna pink yang lebih terang. Ini membantu dalam menjaga konsistensi visual aplikasi.

### Halaman Utama
```dart
      // tetapkan home untuk aplikasi, yang merupakan halaman utama
      home: MyHomePage(),
    );
  }
}
```
- **Home**: Menetapkan `home` dari `MaterialApp` ke `MyHomePage`, yang berarti halaman utama aplikasi adalah `MyHomePage`. Hal ini memungkinkan pengguna untuk melihat konten yang ditentukan dalam `MyHomePage` saat aplikasi dijalankan.

---

Dengan penjelasan di atas, Anda dapat memberikan gambaran yang jelas tentang bagaimana setiap bagian dari kode berkontribusi pada implementasi aplikasi dan bagaimana checklist tersebut diintegrasikan dalam proyek Anda. Jika ada pertanyaan lebih lanjut atau bagian lain yang perlu dijelaskan, silakan beri tahu!

**B. Membuat file menu.dart**
1. **Mendefinisikan Class `ShopItem`**: Class ini memiliki dua atribut, yaitu `name` dan `icon`, yang menyimpan informasi tentang item yang akan ditampilkan di halaman utama.

```dart
class ShopItem {
  final String name; // Nama item
  final IconData icon; // Ikon yang terkait dengan item

  ShopItem(this.name, this.icon);
}```

2. **Membuat Daftar Item di `MyHomePage`**: Di dalam `MyHomePage`, saya membuat daftar `items` yang berisi objek `ShopItem` yang akan ditampilkan dalam tampilan grid.

```dart
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // Daftar item yang akan ditampilkan
  final List<ShopItem> items = [
    ShopItem("Lihat Daftar Produk", Icons.checklist),
    ShopItem("Tambah Produk", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];```

3. **Menggunakan GridView**: Dengan menggunakan `GridView.count`, saya menampilkan `ShopCard` untuk setiap `ShopItem` dalam format grid yang responsif.

```dart
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
                }).toList(),```

4. **Membuat `ShopCard`**: Setiap `ShopCard` menampilkan ikon dan nama item. Ketika pengguna mengklik card tersebut, akan muncul `SnackBar` yang memberikan umpan balik bahwa tombol telah ditekan, menggunakan widget `InkWell`.

```dart
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
}```


# Tugas 8 PBP
# JopuleeGift README

Berikut adalah jawaban untuk beberapa pertanyaan yang bisa kamu tambahkan ke dalam file README.md untuk tugas ini:

---

### 1. Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?

Kegunaan `const` di Flutter adalah untuk mendeklarasikan objek yang bersifat **immutable** atau tidak dapat diubah dan dikompilasi pada waktu **compile-time**. Dengan menggunakan `const`, kita dapat memastikan bahwa suatu objek tidak akan berubah nilai atau isinya selama aplikasi berjalan. 

Keuntungan menggunakan `const`:
- **Optimalisasi Memori**: Objek yang ditandai dengan `const` hanya akan dibuat sekali dan disimpan dalam memori untuk digunakan kembali, sehingga mengurangi penggunaan memori.
- **Peningkatan Kinerja**: `const` memungkinkan Flutter mengoptimalkan proses rendering UI karena Flutter mengetahui bahwa widget tersebut tidak akan berubah. Ini dapat mempercepat waktu rendering.
- **Keterbacaan Kode**: Menandai elemen sebagai `const` membantu pengembang memahami bahwa elemen tersebut tidak akan berubah, yang mempermudah pemeliharaan kode.

Kapan sebaiknya menggunakan `const`:
- Ketika kita yakin bahwa objek atau widget tidak akan mengalami perubahan (seperti teks statis atau ikon).
- Saat bekerja dengan widget yang tidak memiliki state yang dinamis.

Kapan tidak menggunakan `const`:
- Ketika kita membutuhkan nilai yang bisa berubah secara dinamis atau bergantung pada input dari pengguna, seperti data dari API atau input formulir yang bervariasi.

---

### 2. Jelaskan dan bandingkan penggunaan `Column` dan `Row` pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

`Column` dan `Row` adalah dua widget layout utama di Flutter yang memungkinkan kita untuk menyusun widget dalam susunan vertikal atau horizontal.

- **Column**: Menyusun elemen secara vertikal dari atas ke bawah. Misalnya, ketika kita ingin menumpuk teks, gambar, dan tombol secara vertikal di halaman.
- **Row**: Menyusun elemen secara horizontal dari kiri ke kanan. Ini cocok digunakan saat kita ingin menyusun beberapa elemen secara sejajar pada baris yang sama.

Contoh implementasi `Column`:

```dart
Column(
  children: [
    Text('Judul Produk'),
    Image.asset('assets/images/produk.jpg'),
    ElevatedButton(
      onPressed: () {},
      child: Text('Tambahkan ke Keranjang'),
    ),
  ],
)
```

Contoh implementasi `Row`:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Icon(Icons.favorite),
    Text('Produk Favorit'),
    Icon(Icons.share),
  ],
)
```

---

### 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Elemen input yang digunakan pada halaman form adalah:
- **TextFormField** untuk nama produk, harga, deskripsi, kategori, dan stok produk.
- **File Picker** untuk memilih gambar dari galeri atau penyimpanan.

Elemen input lain yang tidak digunakan dalam tugas ini:
- **Checkbox**: Berguna untuk pilihan ya/tidak atau beberapa pilihan.
- **Radio Button**: Cocok untuk pilihan dengan satu jawaban dari beberapa opsi.
- **Dropdown Button**: Berguna untuk pilihan yang lebih ringkas dan hemat ruang.
- **Slider**: Berguna untuk memilih nilai dalam rentang tertentu, misalnya, memilih harga atau stok dengan kisaran tertentu.

---

### 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Untuk mengatur tema di Flutter, kita dapat mendefinisikan tema global dalam widget utama aplikasi menggunakan `ThemeData`. Ini memungkinkan kita mendefinisikan warna utama, warna latar belakang, teks, dan elemen UI lainnya secara konsisten di seluruh aplikasi.

Contoh pengaturan tema:

```dart
MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.pinkAccent,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.pinkAccent,
      textTheme: ButtonTextTheme.primary,
    ),
  ),
);
```

Pada aplikasi yang dibuat, **tema utama** menggunakan warna `pinkAccent` untuk memberikan konsistensi pada warna di seluruh elemen aplikasi, seperti AppBar dan tombol.

---

### 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Dalam aplikasi Flutter, navigasi antar halaman dapat diatur menggunakan **Navigator** dan **Route**. Navigator berfungsi seperti tumpukan (stack) halaman, di mana kita dapat menambahkan (push) atau menghapus (pop) halaman sesuai kebutuhan.

Contoh navigasi ke halaman baru:

```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HalamanBaru()),
);
```

Untuk kembali ke halaman sebelumnya:

```dart
Navigator.pop(context);
```

Aplikasi mobile ini (jopulee_gift) juga menggunakan **Drawer** untuk menavigasi antar halaman utama dan halaman form tambah item. Drawer memungkinkan pengguna mengakses halaman dengan mudah dan memberikan pengalaman pengguna yang konsisten dalam aplikasi dengan banyak halaman.


## Tugas 9


## 1. **Mengapa Perlu Membuat Model untuk Pengambilan atau Pengiriman Data JSON?**
   Model digunakan untuk memetakan data JSON ke objek yang lebih mudah dikelola dalam aplikasi. Tanpa model, parsing data JSON bisa berantakan dan berpotensi menyebabkan error atau data yang tidak sesuai.

## 2. **Fungsi dari Library HTTP**
   Library `http` memungkinkan Flutter untuk berkomunikasi dengan API Django, baik untuk mengirimkan data (misalnya login, registrasi) maupun menerima data (seperti daftar item) dalam format JSON.

## 3. **Fungsi dari CookieRequest dan Mengapa Perlu Dibagikan**
   `CookieRequest` menyimpan token autentikasi atau cookies untuk menjaga sesi pengguna. Instance ini perlu dibagikan ke seluruh aplikasi untuk memastikan bahwa setiap request yang membutuhkan autentikasi menggunakan token yang sama.

## 4. **Mekanisme Pengiriman Data dari Input ke Flutter**
   Pengguna mengisi data di Flutter, data dikirimkan ke Django via HTTP `POST`, Django memproses dan mengirim respons kembali ke Flutter, yang kemudian menampilkan hasil atau status kepada pengguna.

## 5. **Mekanisme Autentikasi dari Login, Register, Hingga Logout**
   - **Login**: Data login dikirim ke Django, jika berhasil, token autentikasi diberikan dan disimpan di Flutter.
   - **Registrasi**: Data dikirim ke Django untuk membuat akun baru, lalu bisa langsung login.
   - **Logout**: Token autentikasi dihapus, dan sesi pengguna berakhir.

## 6. **Implementasi Checklist Secara Step-by-Step**
   - **Step 1**: Membuat model di Django untuk item.
   - **Step 2**: Membuat API endpoint untuk mengirim data item ke Flutter.
   - **Step 3**: Menyusun UI di Flutter untuk login, registrasi, dan menampilkan daftar item.
   - **Step 4**: Integrasi HTTP untuk mengambil data dari Django.
   - **Step 5**: Implementasi login dan registrasi dengan token autentikasi.
   - **Step 6**: Testing dan debugging untuk memastikan semua berjalan dengan baik.
