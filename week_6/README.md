Nama : Annisa Kurniawati

NIM : 2341720070

# Praktikum 1: Membangun Layout di Flutter

**Langkah 1: Buat Project Baru**

**Langkah 2: Buka file lib/main.dart**

<img width="1920" height="1080" alt="Screenshot 2025-10-02 144935" src="https://github.com/user-attachments/assets/c998cc93-7e33-49bf-94e1-ca070b1e438f" />

**Langkah 3: Identifikasi layout diagram**

Langkah pertama adalah memecah tata letak menjadi elemen dasarnya:

Identifikasi baris dan kolom.
Apakah tata letaknya menyertakan kisi-kisi (grid)?
Apakah ada elemen yang tumpang tindih?
Apakah UI memerlukan tab?
Perhatikan area yang memerlukan alignment, padding, atau borders.

**Langkah 4: Implementasi title row**

**Soal 1**: Letakkan widget Column di dalam widget Expanded agar menyesuaikan ruang yang tersisa di dalam widget Row. Tambahkan properti crossAxisAlignment ke CrossAxisAlignment.start sehingga posisi kolom berada di awal baris.

<img width="265" height="40" alt="image" src="https://github.com/user-attachments/assets/7ad24e78-6c4c-483c-b3dd-7d5178817d13" />

**Soal 2**: Letakkan baris pertama teks di dalam Container sehingga memungkinkan Anda untuk menambahkan padding = 8. Teks ‘Batu, Malang, Indonesia' di dalam Column, set warna menjadi abu-abu.

<img width="261" height="99" alt="image" src="https://github.com/user-attachments/assets/57a787f5-332a-4d02-9b93-544c751483a5" />


**Soal 3**: Dua item terakhir di baris judul adalah ikon bintang, set dengan warna merah, dan teks "41". Seluruh baris ada di dalam Container dan beri padding di sepanjang setiap tepinya sebesar 32 piksel. Kemudian ganti isi body text ‘Hello World' dengan variabel titleSection 

<img width="228" height="90" alt="image" src="https://github.com/user-attachments/assets/6cc989ea-d3a4-4d3c-bc71-705c3a791b3a" />

Hasil: 

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/bf4dc16c-1a2e-49a0-864f-b14e4910875b" />


# Praktikum 2: Implementasi button row

**Langkah 1: Buat method Column _buildButtonColumn**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/d67084d4-d650-4d19-ae06-ce650394b11a" />

**Langkah 2: Buat widget buttonSection**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/905e66f5-4373-4ec4-a5ab-67fd20dc3f18" />

**Langkah 3: Tambah button section ke body**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/a1be0024-6702-412a-a28d-d593ed10b726" />

# Praktikum 3: Implementasi text section

**Langkah 1: Buat widget textSection**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/087d281f-121d-4573-9cef-cdb5c88dcc0a" />

**Langkah 2: Tambahkan variabel text section ke body**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/a7241d52-131a-4187-821d-601ce9a867cd" />

# Praktikum 4: Implementasi image section

**Langkah 1: Siapkan aset gambar**

<img width="109" height="48" alt="image" src="https://github.com/user-attachments/assets/3fcbbe17-23f3-4c19-a715-283794d70679" />

**Langkah 2: Tambahkan gambar ke body**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/f6ece692-e0fc-4982-84f2-9bb51c3a0bf0" />

**Langkah 3: Terakhir, ubah menjadi ListView**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/36fd3560-e992-44c7-b3bf-09eff6e8ed36" />

# Tugas Praktikum 1

# Tata letak widget

**1. Pilih widget tata letak**

<img width="89" height="22" alt="image" src="https://github.com/user-attachments/assets/c43cb60b-ae4f-454d-9449-c8f06784eb28" />

**2. Buat widget yang terlihat**

<img width="75" height="22" alt="image" src="https://github.com/user-attachments/assets/32e1369d-c390-4a3e-89dc-5efe9150c0c2" />

**3. Tambahkan widget yang terlihat ke widget tata letak**

<img width="89" height="22" alt="image" src="https://github.com/user-attachments/assets/c43cb60b-ae4f-454d-9449-c8f06784eb28" />

**4. Tambahkan widget tata letak ke halaman**

Aplikasi Standar

<img width="1920" height="1080" alt="Screenshot 2025-10-05 125048" src="https://github.com/user-attachments/assets/47407fcc-01c7-4209-9ee2-a6c9e517669c" />

Aplikasi Material

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/09d3b0b9-10b1-470f-8c0f-94c280eb55c0" />

**Tata beberapa widget**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/bd39a9c0-d515-47a9-b979-a367a59ebe22" />

**Tampilan Grid**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/ab830a1b-d525-4e4a-a146-a21c1472e3c2" />

**Tampilan Daftar Warna**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/8ad35de6-9930-4dac-90ce-941e2a1f96a8" />

**Tumpukan**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/37438759-e906-4556-b6cf-08e598c9195e" />

**Kartu**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/d09cf76a-064f-4633-969e-9f36d719db04" />

**ListTile**

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/8cb0244a-923d-4bfc-bc9d-cf53ca9e82bb" />

# Praktikum 5: Membangun Navigasi di Flutter
**Langkah 1: Siapkan project baru**

Sebelum melanjutkan praktikum, buatlah sebuah project baru Flutter dengan nama belanja dan susunan folder seperti pada gambar berikut. Penyusunan ini dimaksudkan untuk mengorganisasi kode dan widget yang lebih mudah.

<img width="75" height="56" alt="image" src="https://github.com/user-attachments/assets/400093dc-c392-4521-bb0b-721253db5e4c" />

**Langkah 2: Mendefinisikan Route**

Buatlah dua buah file dart dengan nama home_page.dart dan item_page.dart pada folder pages. Untuk masing-masing file, deklarasikan class HomePage pada file home_page.dart dan ItemPage pada item_page.dart. Turunkan class dari StatelessWidget. Gambaran potongan kode dapat anda lihat sebagai berikut.

home_page.dart

```dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
```

item_page.dart

```dart
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    throw UnimplementedError();
  }
```

**Langkah 3: Lengkapi Kode di main.dart**

Setelah kedua halaman telah dibuat dan didefinisikan, bukalah file main.dart. Pada langkah ini anda akan mendefinisikan Route untuk kedua halaman tersebut. Definisi penamaan route harus bersifat unique. Halaman HomePage didefinisikan sebagai /. Dan halaman ItemPage didefinisikan sebagai /item. Untuk mendefinisikan halaman awal, anda dapat menggunakan named argument initialRoute. Gambaran tahapan ini, dapat anda lihat pada potongan kode berikut.

``dart
import 'package:flutter/material.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/item': (context) => const ItemPage(),
    },
  ));
}
```

**Langkah 4: Membuat data model**

Sebelum melakukan perpindahan halaman dari HomePage ke ItemPage, dibutuhkan proses pemodelan data. Pada desain mockup, dibutuhkan dua informasi yaitu nama dan harga. Untuk menangani hal ini, buatlah sebuah file dengan nama item.dart dan letakkan pada folder models. Pada file ini didefinisikan pemodelan data yang dibutuhkan. Ilustrasi kode yang dibutuhkan, dapat anda lihat pada potongan kode berikut.

``dart
class Item {
  String name;
  int price;
  String photo;
  int stock;
  double rating;

  Item({
    required this.name,
    required this.price,
    required this.photo,
    required this.stock,
    required this.rating,
  });
}
```

**Langkah 5: Lengkapi kode di class HomePage**

Pada halaman HomePage terdapat ListView widget. Sumber data ListView diambil dari model List dari object Item. Gambaran kode yang dibutuhkan untuk melakukan definisi model dapat anda lihat sebagai berikut.

<img width="317" height="424" alt="image" src="https://github.com/user-attachments/assets/ec6ee42c-5088-4c63-879a-46d8de724875" />


**Langkah 6: Membuat ListView dan itemBuilder**

Untuk menampilkan ListView pada praktikum ini digunakan itemBuilder. Data diambil dari definisi model yang telah dibuat sebelumnya. Untuk menunjukkan batas data satu dan berikutnya digunakan widget Card. Kode yang telah umum pada bagian ini tidak ditampilkan. Gambaran kode yang dibutuhkan dapat anda lihat sebagai berikut.

``dart
@override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(child: Text(item.name)),
                    Expanded(
                      child: Text(
                        item.price.toString(),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  } 
```

**Langkah 7: Menambahkan aksi pada ListView**

Item pada ListView saat ini ketika ditekan masih belum memberikan aksi tertentu. Untuk menambahkan aksi pada ListView dapat digunakan widget InkWell atau GestureDetector. Perbedaan utamanya InkWell merupakan material widget yang memberikan efek ketika ditekan. Sedangkan GestureDetector bersifat umum dan bisa juga digunakan untuk gesture lain selain sentuhan. Pada praktikum ini akan digunakan widget InkWell.

Untuk menambahkan sentuhan, letakkan cursor pada widget pembuka Card. Kemudian gunakan shortcut quick fix dari VSCode (Ctrl + . pada Windows atau Cmd + . pada MacOS). Sorot menu wrap with widget... Ubah nilai widget menjadi InkWell serta tambahkan named argument onTap yang berisi fungsi untuk berpindah ke halaman ItemPage. Ilustrasi potongan kode dapat anda lihat pada potongan berikut.

# Tugas Praktikum 2















