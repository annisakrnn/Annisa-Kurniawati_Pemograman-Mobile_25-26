Nama: Annisa Kurniawati

NIM: 2341720070

Kelas: TI/3H

**Praktikum 1**

Langkah 1: Buat Project Baru Kemudian Tambahkan dependensi http dengan mengetik perintah berikut di terminal.

<img width="331" height="41" alt="image" src="https://github.com/user-attachments/assets/aae49664-2baa-4134-816a-1df234273538" />

Langkah 2: Cek file pubspec.yaml

<img width="157" height="119" alt="image" src="https://github.com/user-attachments/assets/908f5251-b4b6-4596-a421-d0c4c1b75f66" />

Langkah 3: Buka file main.dart

```
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book from the future')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(child: const Text('GO!'), onPressed: () {}),
            const Spacer(),
            Text(result),
            const Spacer(),
            const CircularProgressIndicator(),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
```

Soal 1: Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

```
title: 'Future Demo Annisa Kurniawati / 2341720070',
```

Langkah 4: Tambah method getData()

Soal 2: 

- Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.

  <img width="728" height="80" alt="image" src="https://github.com/user-attachments/assets/c9fa79d7-531d-4f3c-9f99-98a669366d99" />

- Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan capture milik Anda dan tulis di README pada laporan praktikum. Lalu lakukan commit dengan pesan "W11: Soal 2".

  <img width="886" height="352" alt="image" src="https://github.com/user-attachments/assets/10e291f6-6c08-46fe-b5f1-0cd3a447d515" />

Langkah 5: Tambah kode di ElevatedButton

```
setState(() {});
                getData()
                    .then((value) {
                      result = value.body.toString().substring(0, 450);
                      setState(() {});
                    })
                    .catchError((error) {
                      result = 'An error occurred';
                      setState(() {});
                    });
              },
            ),
```

Hasil GIF:

<img src="https://github.com/user-attachments/assets/5cd4637d-eefd-4541-aa72-cee68d2cdc49" width="150">

Soal 3: Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!

Fungsi substring pada code untuk menampilkan 450 karakter pertama dari teks yang diambil dari value.body yang berisi teks hasil response HTTP yang berformat JSON. Lalu untuk catchError untuk menjalankan jika terjadi error saat memanggil getData(). Jika error maka akan menampilkan pesan An error occured atau gagal

**Praktikum 2**

Langkah 1: Buka file main.dart

```
Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }
```

Langkah 2: Tambah method count()

```
Future count() async{
    int total = 0;
    total += await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }
```

Langkah 3: Panggil count()

```
ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
              count();
              },
            ),
```

Langkah 4: Run dan Hasil GIF:

<img src="https://github.com/user-attachments/assets/7e760426-5aa9-4969-b993-aa14905de961" width="150">

Soal 4: Jelaskan maksud kode langkah 1 dan 2 tersebut!

Maksud kode langkah 1 untuk proses yang membutuhkan waktu (seperti mengambil data dari server), lalu mengembalikan angka 1 setelah 3 detik. dan maksud langkah 2 untuk menjalankkan tugas asinkron dan akan memberikan angka 2 setelah 3 detik.

**Praktikum 3**

Langkah 1: Buka main.dart

```
import 'package:async/async.dart';
```

Langkah 2: Tambahkan variabel dan method

```
late Completer completer;
  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }
  Future calculate() async {
    await Future.delayed(const Duration(seconds: 5));
    completer.complete(42);
  }
```

Langkah 3: Ganti isi kode onPressed()

```getNumber().then((value) {
                  setState(() {
                    result = value.toString();
                  });
                });
```

Langkah 4: Run dan Hasil GIF:

<img src="https://github.com/user-attachments/assets/28d121ae-120f-494f-b56b-13450cfc68cf" width="150">

Soal 5: Jelaskan maksud kode langkah 2 tersebut!

Fungsi kode langkah 2 adalah fungsi calculate() untuk menyelesaikan (complete) pada proses Future secara manual setelah menunggu selama 5 detik. Didalamnya , terdapat perintah await Future.delayed(const Duration(seconds: 5)); yang menjalankan proses yang memakan waktu (seperti pemrosesan data atau pengambilan informasi dari server). Setelah waktu tunggu selesai, perintah completer.complete(42); dijalankan untuk memberikan nilai hasil (42) kepada Future yang sebelumnya dibuat di fungsi getNumber()

Langkah 5: Ganti method calculate()

```calculate() async {
    //langkah 3 praktikum 3
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
      //throw Exception();
    } catch (_) {
      completer.completeError({});
    }
```

Langkah 6: Pindah ke onPressed()

```
getNumber().then((value) {
                  setState(() {
                    result = value.toString();
                  });
                //langkah 6 praktikum 3
                }).catchError((e) {
                  result = 'An error occurred';
                });
```

Soal 6: Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut dan Hasil GIF!

<img src="https://github.com/user-attachments/assets/28d121ae-120f-494f-b56b-13450cfc68cf" width="150">

Perbedaanya langkah 2 menyelesaikan Future dengan hasil sukses (complete (42)), tidak menggunakan try-catch, dan menampilkan hasil angka dari Future sedangkan langkah 5 dan 6 menangani 2 kemungkinan saar sukses (complete(42)) dan gagal (completeError), langkah ini menggunakan try-catch, dan mampu menampilkan pesan error.

**Praktikum 4**

Langkah 1: Buka file main.dart

```
void returnFG() {
    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();
    futureGroup.future.then((List<int> value) {
      int total = 0;
      for (var element in value) {
        total += element;
      }
      setState(() {
        result = total.toString();
      });
    });
  }
```

Langkah 2: Edit onPressed()

```
onPressed: () {
                //langlah 2 praktikum 4
                returnFG();
```

Langkah 3: Run

Soal 7: Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 7".

<img src="https://github.com/user-attachments/assets/5cd4637d-eefd-4541-aa72-cee68d2cdc49" width="150">


Langkah 4: Ganti variabel futureGroup

Soal 8: Jelaskan maksud perbedaan kode langkah 1 dan 4!

**Praktikum 5**

Langkah 1: Buka file main.dart

Langkah 2: ElevatedButton

Langkah 3: Run

Soal 9: Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 9".

Langkah 4: Tambah method handleError()

Soal 10: Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!

**Praktikum 6**

Langkah 1: install plugin geolocator

Langkah 2: Tambah permission GPS

Langkah 3: Buat file geolocation.dart

Langkah 4: Buat StatefulWidget

Langkah 5: Isi kode geolocation.dart

Soal 11: Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.

Langkah 6: Edit main.dart

Langkah 7: Run

Langkah 8: Tambahkan animasi loading

Soal 12:

- Jika Anda tidak melihat animasi loading tampil, kemungkinan itu berjalan sangat cepat. Tambahkan delay pada method getPosition() dengan kode await Future.delayed(const Duration(seconds: 3));

- Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 12".

**Praktikum 7**

Langkah 1: Modifikasi method getPosition()

Langkah 2: Tambah variabel

Langkah 3: Tambah initState()

Langkah 4: Edit method build()

Soal 13:

- Apakah ada perbedaan UI dengan praktikum sebelumnya? Mengapa demikian?

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 13".

- Seperti yang Anda lihat, menggunakan FutureBuilder lebih efisien, clean, dan reactive dengan Future bersama UI.

Langkah 5: Tambah handling error

Soal 14: Apakah ada perbedaan UI dengan langkah sebelumnya? Mengapa demikian? dan hasil GIF!

**Praktikum 8**

Langkah 1: Buat file baru navigation_first.dart

Langkah 2: Isi kode navigation_first.dart

Soal 15: Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda dan Silakan ganti dengan warna tema favorit Anda.

Langkah 3: Tambah method di class _NavigationFirstState

Langkah 4: Buat file baru navigation_second.dart

Langkah 5: Buat class NavigationSecond dengan StatefulWidget

Langkah 6: Edit main.dart

Langkah 8: Run

Soal 16: 

- Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?

- Gantilah 3 warna pada langkah 5 dengan warna favorit Anda!

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 16".

**Praktikum 9**

Langkah 1: Buat file baru navigation_dialog.dart

Langkah 2: Isi kode navigation_dialog.dart

Langkah 3: Tambah method async

Langkah 4: Panggil method di ElevatedButton

Langkah 5: Edit main.dart

Langkah 6: Run

Soal 17:

- Cobalah klik setiap button, apa yang terjadi ? Mengapa demikian ?

- Gantilah 3 warna pada langkah 3 dengan warna favorit Anda!

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 17".






