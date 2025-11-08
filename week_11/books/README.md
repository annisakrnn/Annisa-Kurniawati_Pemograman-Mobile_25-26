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

```
 final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);
```

Soal 8: Jelaskan maksud perbedaan kode langkah 1 dan 4!

Perbedaanya jika FutureGroup digunakan saat jumlah Future tidak tetap atau ingin menambah Future secara bertahap sebelum menutup grup dan jika Future.wait() digunakan saat daftar Future sudah diketahui dari awal dan ingin menunggu hasil semuanya sekaligus.

**Praktikum 5**

Langkah 1: Buka file main.dart

```
Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }
```

Langkah 2: ElevatedButton

```
 returnError()
                    .then((value) {
                      setState(() {
                        result = 'Success!';
                      });
                    })
                    .catchError((onError) {
                      setState(() {
                        result = onError.toString();
                      });
                    }).whenComplete(() => print('Complete'));
```

Langkah 3: Run

Soal 9: Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 9".

<img src="https://github.com/user-attachments/assets/f241ba9a-39fc-45b8-91d8-586c3fbc9a7d" width="150">

Langkah 4: Tambah method handleError()

```
Future handleError() async {
    try {
      await returnError();
    } catch (error) {
      setState(() {
        result = error.toString();
      });
    } finally {
      print('Complete');
    }
  }
```

Soal 10: Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!

```
onPressed: () {
                //soal 10 praktikum 5
                handleError();
```

Hasilnya sama dan pada bagian debug console akan terlihat teks Complete

**Praktikum 6**

Langkah 1: install plugin geolocator

<img width="352" height="30" alt="image" src="https://github.com/user-attachments/assets/e8a2aa32-2c90-435a-85f7-784c96f03141" />

Langkah 2: Tambah permission GPS

```
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```

Langkah 3: Buat file geolocation.dart

<img width="110" height="24" alt="image" src="https://github.com/user-attachments/assets/0dcfb6ef-e7d5-4e93-90ef-7d39c6c1f88a" />

Langkah 4: Buat StatefulWidget

Langkah 5: Isi kode geolocation.dart

```
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';

  @override
  void initState() {
    super.initState();
    getPosition().then((Position myPos) {
      myPosition =
          'Latitude: ${myPos.latitude}, Longitude: ${myPos.longitude.toString()}';
      setState(() {
        myPosition = myPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location Annisa')),
      body: Center(child: Text(myPosition)),
    );
  }

  Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    Position positon = await Geolocator.getCurrentPosition();
    return positon;
  }
}
```

Soal 11: Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda.

```
appBar: AppBar(title: const Text('Current Location Annisa')),
```

Langkah 6: Edit main.dart

```
home: LocationScreen(),
```

Langkah 7: Run

<img width="161" height="289" alt="image" src="https://github.com/user-attachments/assets/e557330b-bb04-473f-b800-c119511762d7" />

Langkah 8: Tambahkan animasi loading

```
@override
  Widget build(BuildContext context) {
    final myWidget = myPosition == ''
        ? const CircularProgressIndicator()
        : Text(myPosition);
    ;
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location Annisa')),
      body: Center(child: myWidget),
    );
  }
```

Soal 12:

- Jika Anda tidak melihat animasi loading tampil, kemungkinan itu berjalan sangat cepat. Tambahkan delay pada method getPosition() dengan kode await Future.delayed(const Duration(seconds: 3));

  ```
  await Future.delayed(const Duration(seconds: 3));
  ```
  
- Apakah Anda mendapatkan koordinat GPS ketika run di browser? Mengapa demikian?

  Seharusnya tidak, namun dikarenakan browser saya memberikan izin dan perangkat mendukung API lokasi maka lokasi akan muncul

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 12".

<img src="https://github.com/user-attachments/assets/82d53636-8adb-42c0-a313-53635dbbbb36" width="150">

**Praktikum 7**

Langkah 1: Modifikasi method getPosition()

```
Future<Position> getPosition() async {
    await Geolocator.requestPermission();
    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));
    Position positon = await Geolocator.getCurrentPosition();
    return positon;
```

Langkah 2: Tambah variabel

```
Future<Position>? position;
```

Langkah 3: Tambah initState()

```
 @override
  void initState() {
    super.initState();
    position = getPosition();
```

Langkah 4: Edit method build()

```
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Current Location Annisa')),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data.toString());
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
```

Soal 13:

- Apakah ada perbedaan UI dengan praktikum sebelumnya? Mengapa demikian?

  Pada tampilan UI tidak ada perubahan, namun ada perubahan pada code nya. praktikum sebelumnya menggunakan setState() dan variabel myPosition untuk memperbarui UI secara manual sedangkan praktikum sekarang menggunakan FutureBuilder untuk membangun UI otomatis berdasarkan status Future (yakni position).

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "W11: Soal 13".

  <img src="https://github.com/user-attachments/assets/82d53636-8adb-42c0-a313-53635dbbbb36" width="150">

- Seperti yang Anda lihat, menggunakan FutureBuilder lebih efisien, clean, dan reactive dengan Future bersama UI.

Langkah 5: Tambah handling error

```
else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Something terrible happened');
              }
              return Text(snapshot.data.toString());
```

Soal 14: Apakah ada perbedaan UI dengan langkah sebelumnya? Mengapa demikian? dan hasil GIF!

Dalam segi UI tidak ada perubahan namun pada kondisi pertama sebelum ditambahkan hasError UI hanya menampilkan dua kondisi: loading (CircularProgressIndicator) dan hasil (Text(snapshot.data)) dan setelah ditambahkan hasError UI kini bisa menampilkan tiga kondisi: loading, hasil, dan pesan error ("Something terrible happened!").

<img src="https://github.com/user-attachments/assets/82d53636-8adb-42c0-a313-53635dbbbb36" width="150">

**Praktikum 8**

Langkah 1: Buat file baru navigation_first.dart

Langkah 2: Isi kode navigation_first.dart

```
import 'package:flutter/material.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: const Text('Navigation First Annisa')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }
```

Soal 15: Tambahkan nama panggilan Anda pada tiap properti title sebagai identitas pekerjaan Anda dan Silakan ganti dengan warna tema favorit Anda.

```
appBar: AppBar(title: const Text('Navigation First Annisa')),
Color color = Colors.blue.shade700;
```

Langkah 3: Tambah method di class _NavigationFirstState

```
Future _navigateAndGetColor(BuildContext context) async {
    color =
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NavigationSecond()),
        ) ??
        Colors.blue;
    setState(() {});
    ;
  }
```

Langkah 4: Buat file baru navigation_second.dart

Langkah 5: Buat class NavigationSecond dengan StatefulWidget

```
import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Second Annisa')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Red'),
              onPressed: () {
                color = Colors.red.shade700;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Green'),
              onPressed: () {
                color = Colors.green.shade700;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                color = Colors.blue.shade700;
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

Langkah 6: Edit main.dart

```
home: NavigationFirst(),
```

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






