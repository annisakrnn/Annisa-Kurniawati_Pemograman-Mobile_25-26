Nama: Annisa Kurniawati

NIM: 2341720070

Kelas: TI/3H

**Praktikum 1: Dart Streams**

Langkah 1: Buat Project Baru

Langkah 2: Buka file main.dart

```
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Annisa',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

Soal 1: 
- Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.
  
```
title: 'Stream Annisa',
```

- Gantilah warna tema aplikasi sesuai kesukaan Anda.

```
theme: ThemeData(primarySwatch: Colors.pink),
```

Langkah 3: Buat file baru stream.dart

```
import 'package:flutter/material.dart';

class ColorStream {
}
```

Langkah 4: Tambah variabel colors

```
final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
```

Soal 2: Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.

```
final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];
```

Langkah 5: Tambah method getColors()

```
Stream<Color> getColors() async* {
}
```

Langkah 6: Tambah perintah yield*

```
Stream<Color> getColors() async* {
  yield* Stream.periodic(const Duration(seconds: 1), (int t) {
    int index = t % colors.length;
    return colors[index];
  });
```

Soal 3:

- Jelaskan fungsi keyword yield* pada kode tersebut!

  untuk mengirim seluruh event dari stream lain  ke stream ini

- Apa maksud isi perintah kode tersebut?

  maksudnya untuk menghasilkan stream warna yang berubah setiap detik dengan urutan berulang

Langkah 7: Buka main.dart

```
import 'stream.dart';
```

Langkah 8: Tambah variabel

```
Color bgColor = Colors.blueGrey;
    late ColorStream colorStream;
```

Langkah 9: Tambah method changeColor()

```
void changeColor() async {
    await for (var eventColor in colorStream.getColors()) {
      setState(() {
        bgColor = eventColor;
      });
    }
  }
}
```
Langkah 10: Lakukan override initState()

```
  @override
void initState() {
  super.initState();
  colorStream = ColorStream();
  changeColor();
}
```

Langkah 11: Ubah isi Scaffold()

```
return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Annisa'),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
      ));
  }
```

Langkah 12: Run 

Soal 4: Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

<img src="https://github.com/user-attachments/assets/8c04a605-1fe7-4c65-8cfa-94daf20f7f10" width="150">

Langkah 13: Ganti isi method changeColor()

```
colorStream.getColors().listen((eventColor) {
```

Soal 5: Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !

await for: bagus untuk proses berurutan dan lebih mudah dibaca seperti loop, event ini di proses ketika menunggu event terlebih dahulu.

listen: bagus untuk UI, event real-time, dan ketika ingin kode tetap lanjut, ini diproses saat callback event datang.

**Praktikum 2: Stream controllers dan sinks**

Langkah 1: Buka file stream.dart

```
import 'dart:async';
```

Langkah 2: Tambah class NumberStream

```
class NumberStream{
}
```

Langkah 3: Tambah StreamController

```
final StreamController<int> _controller = StreamController<int>();
```

Langkah 4: Tambah method addNumberToSink

```
 void addNumberToSink(int number) {
    _controller.sink.add(number);
  }
```

Langkah 5: Tambah method close()

```
close() {
      _controller.close();
    }
```

Langkah 6: Buka main.dart

```
import 'dart:async';
import 'dart:math';
```

Langkah 7: Tambah variabel

```
 int lastNumber = 0;
  late NumberStream numberStream;
  late StreamController numberStreamController;
```

Langkah 8: Edit initState()

```
@override
  void initState() {
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    stream.listen((eventNumber) {
      setState(() {
        lastNumber = eventNumber;
      });
    });
  }
```

Langkah 9: Edit dispose()

```
@override
  void dispose() {
    numberStreamController.close();
    super.dispose();
  }
```

Langkah 10: Tambah method addRandomNumber()

```
void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
  }
```

Langkah 11: Edit method build()

```
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Annisa')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastNumber.toString()),
            ElevatedButton(
              onPressed: () => addRandomNumber(),
              child: Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
```

Langkah 12: Run

Soal 6

- Jelaskan maksud kode langkah 8 dan 10 tersebut!

  maksud langkah 8 (initState + listen) untuk mempersiapkan stream dan mengubah dengan angka baru, maksudnya UI akan otomatis updte setiap ada angka yang masuk stream
  
  maksud langkah 10 adalah mengirim angka acaak ke stream, maksudnya angka dikirim ke listener -> lastNumber berubah -> UI update

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

  <img src="https://github.com/user-attachments/assets/0d02e6a1-46a0-4af1-9f45-01b3d7fa16a7" width="150">

Langkah 13: Buka stream.dart

```
addError() {
    controller.sink.addError('error');
  }
```

Langkah 14: Buka main.dart

```
stream
        .listen((eventNumber) {
          setState(() {
            lastNumber = eventNumber;
          });
        })
        .onError((error) {
          setState(() {
            lastNumber = -1;
          });
        });
```

Langkah 15: Edit method addRandomNumber()

```
void addRandomNumber() {
    Random random = Random();
    // int myNum = random.nextInt(10);
    // numberStream.addNumberToSink(myNum);
    numberStream.addError();
  }
```

Soal 7

- Jelaskan maksud kode langkah 13 sampai 15 tersebut!

  langkah 13 untuk membuat fungsi addError() untuk mengirim error ke stream menggunakan .sink.addError()

  langkah 14 untuk menonaktifkan pengiriman angka supaya tombol tidak mengirim angka random

  langkah 15 memanggil addError() ketika tombol ditekan supaya stream menerima error dan menjalankan callback onError 

- Kembalikan kode seperti semula pada Langkah 15, comment addError() agar Anda dapat melanjutkan ke praktikum 3 berikutnya.

  ```
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
    // numberStream.addError();
  }
  ```

**Praktikum 3: Injeksi data ke streams**

Langkah 1: Buka main.dart

```
late StreamTransformer transformer;
```

Langkah 2: Tambahkan kode ini di initState

```
transformer = StreamTransformer<int, int>.fromHandlers(
    handleData: (value, sink) {
      sink.add(value * 10);
    },
    handleError: (error, trace, sink) {
      sink.add(-1);
    },
    handleDone: (sink) => sink.close());
```

Langkah 3: Tetap di initState

```
stream
        .transform(transformer)
        .listen((event) {
          setState(() {
            lastNumber = event;
          });
        })
        .onError((error) {
          setState(() {
            lastNumber = -1;
          });
        });
    super.initState();
```

Langkah 4: Run

Soal 8

- Jelaskan maksud kode langkah 1-3 tersebut!

  maksuud langkah 1 late StreamTransformer transformer; adalah menyiapkan variabel transformer yang akan digunakan untuk memproses stream

  maksud langkah 2 StreamTransformer.fromHandlers adalah mendefinisikan bagaimana data, error, dan done diproses (value ×10, error -> -1, done -> close)

  maksud langkah 3 stream.transform adalah mengikat stream ke transformer dan meng-update UI ketika nilai baru / error diterima

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

 <img src="https://github.com/user-attachments/assets/5a7c350f-f9bd-48b5-9be6-ece7d5edaf1b" width="150">

**Praktikum 4: Subscribe ke stream events**

Langkah 1: Tambah variabel

```
late StreamSubscription subscription;
```

Langkah 2: Edit initState()

```
numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    subscription = stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
    super.initState();
```

Langkah 3: Tetap di initState()

```
subscription.onError((error) {
          setState(() {
            lastNumber = -1;
          });
        });
```

Langkah 4: Tambah properti onDone()

```
subscription.onDone(() {
            print('OnDone was called');
          });
```

Langkah 5: Tambah method baru

```
void stopStream() {
    numberStreamController.close();
  }
```

Langkah 6: Pindah ke method dispose()

```
subscription.cancel();
```

Langkah 7: Pindah ke method build()

```
 ElevatedButton(
              onPressed: () => stopStream(),
              child: Text('Stop Subsciption'),
            ),
```

Langkah 8: Edit method addRandomNumber()

```
void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      numberStream.addNumberToSink(myNum);
    } else {
      setState(() {
        lastNumber = -1;
      });
```

Langkah 9: Run

<img width="150" height="506" alt="image" src="https://github.com/user-attachments/assets/90d29f8b-563b-42ab-b97a-0f922a71c30b" />

Soal 9

- Jelaskan maksud kode langkah 2, 6 dan 8 tersebut!

  maksud langkah 2 inisialisasi stream dan controller yaitu menyiapkan stream yang akan dipanggil di UI

  maksud langkah 6 subscription.cancel() yaitu menghentikan subscription stream

  maksud langkah 8 mengirim angka random ke stream yaitu menambah data baru ke stream jika masih terbuka

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

**Praktikum 5: Multiple stream subscriptions**

Langkah 1: Buka file main.dart

```
late StreamSubscription subscription2;
  String values = '';
```

Langkah 2: Edit initState()

```
subscription = stream.listen((event) {
      setState(() {
        values += '$event - ';
        subscription.onError((error) {
          setState(() {
            lastNumber = -1;
          });
        });
        subscription2 = stream.listen((event) {
          setState(() {
            values += '$event - ';
          });
        });
```

Langkah 3: Run

<img width="150" height="23" alt="image" src="https://github.com/user-attachments/assets/7c3ef985-c1e7-4e19-b898-73737f1f4648" />

Soal 10: Jelaskan mengapa error itu bisa terjadi ?

Error terjadi karena kamu memanggil .add() setelah StreamController     sudah di-close.

Langkah 4: Set broadcast stream

```
Stream stream = numberStreamController.stream.asBroadcastStream();
```

Langkah 5: Edit method build()

```
Text(values),
```

Langkah 6: Run

Soal 11:

- Jelaskan mengapa hal itu bisa terjadi ?

  Karena stream diubah menjadi broadcast stream menggunakan .asBroadcastStream(), maka akibatnya broadcast stream mengizinkan banyak listener dan menerima data secara bersamaan tanpa erroor

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

  <img src="https://github.com/user-attachments/assets/df45557d-7f31-4329-a2ce-13a7f7fe1a6f" width="150">

**Praktikum 6: StreamBuilder**

Langkah 1: Buat Project Baru

Langkah 2: Buat file baru stream.dart

```
class NumberStream()
```

Langkah 3: Tetap di file stream.dart

```
import 'dart:math';

class NumberStream {
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10);
      return myNum;
    });
  }
}
```

Langkah 4: Edit main.dart

```

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Annisa',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const StreamHomePage(),
    );
  }
}
```

Langkah 5: Tambah variabel

```
late Stream<int> numberStream;
```

Langkah 6: Edit initState()

```
 @override
  void initState() {
    super.initState();
    numberStream = NumberStream().getNumbers();
  }
```

Langkah 7: Edit method build()

```
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream Annisa')),
      body: StreamBuilder(
        stream: numberStream,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error');
          }
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 96),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
```

Langkah 8: Run

Soal 12:

- Jelaskan maksud kode pada langkah 3 dan 7 !

  maksud dari langkah 3 adalah membuat stream secara otomatis untuk mengeluarkan angka acak setiap 1 detik tanpa berhenti dengan  getNumbers()

  maksud dari langkah 7 adalah menampilkan angka terbaru secara otomatis setiap ada data baru dari StreamBuilder dan snapshot.data

- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

  <img src="https://github.com/user-attachments/assets/5f515afc-22e3-45d4-aa42-f1574324ee5c" width="150">

**Praktikum 7: BLoC Pattern**

Langkah 1: Buat Project baru

Langkah 2: Isi kode random_bloc.dart

```
import 'dart:async';
import 'dart:math';
```

Langkah 3: Buat class RandomNumberBloc()

```
class RandomNumberBloc{}
```

Langkah 4: Buat variabel StreamController

```
final _generateRandomController = StreamController<void>();
final _randomNumberController = StreamController<int>();
Sink<void> get generationRandom => _generateRandomController.sink;
Stream<int> get randomNumber => _randomNumberController.stream;
_secondsStreamController.sink;
```

Langkah 5: Buat constructor

```
RandomNumberBloc() {
  _generateRandomController.stream.listen((_){
    final random = Random().nextInt(10);
    _randomNumberController.sink.add(random);
  });
}
```

Langkah 6: Buat method dispose()

```
void dispose() {
  _generateRandomController.close();
  _randomNumberController.close();
}
```

Langkah 7: Edit main.dart

```
import 'package:flutter/material.dart';
import 'random_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RandomScreen(),
    );
  }
}
```

Langkah 8: Buat file baru random_screen.dart

Langkah 9: Lakukan impor material dan random_bloc.dart

```
import 'package:flutter/material.dart';
import 'random_bloc.dart';
```

Langkah 10: Buat StatefulWidget RandomScreen

Langkah 11: Buat variabel

```
final _bloc = RandomNumberBloc();
```

Langkah 12: Buat method dispose()

```
@override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
```

Langkah 13: Edit method build()

```
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Number')),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Random Number: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.generateRandom.add(null),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
```

Soal 13

- Jelaskan maksud praktikum ini ! Dimanakah letak konsep pola BLoC-nya ?

  Praktikum ini untuk pemisahan logika antara UI [pengguna melalui pola
  BLoC (Business Logic Component).

  Penerapanya pada penggunaan StreamController, di mana sink berfungsi
  sebagai pintu masuk event (input) dan stream sebagai sumber data
  keluaran (output). UI hanya bertugas mendengarkan perubahan data
  lewat StreamBuilder, sedangkan seluruh proses pembuatan angka acak
  dikelola sepenuhnya di dalam BLoC.
  
- Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

  <img src="https://github.com/user-attachments/assets/ca2ee02f-eeb7-436d-bbac-9aefe4d79718" width="150">



