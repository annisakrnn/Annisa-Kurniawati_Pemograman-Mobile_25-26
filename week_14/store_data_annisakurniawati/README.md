Nama: Annisa Kurniawati

NIM: 2341720070

Kelas: TI/3H

**Praktikum 1: Konversi Dart model ke JSON**

Soal 1

- Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

  ```
  appBar: AppBar(title: const Text('JSON Annisa')),
  ```

- Gantilah warna tema aplikasi sesuai kesukaan Anda.

  ```
  theme: ThemeData(primarySwatch: Colors.pink),
  ```

Soal 2: hasil run langkah 10

<img width="374" height="503" alt="Screenshot 2025-11-21 195111" src="https://github.com/user-attachments/assets/5d5d0833-ea20-454e-904c-4e2630dbd7b3" />

Soal 3: 

- Masukkan hasil capture layar ke laporan praktikum Anda.

- Hasil run langkah 26

<img width="369" height="501" alt="Screenshot 2025-11-22 094716" src="https://github.com/user-attachments/assets/e072b8f9-14a6-4fdf-9198-567cec7c2520" />

<img width="449" height="142" alt="Screenshot 2025-11-22 100329" src="https://github.com/user-attachments/assets/4896f2d1-ca09-4a8d-881d-aa1f563f0ca3" />

Code Praktikum 1

Main.dart

```
import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';
  List<Pizza> myPizzas = [];
  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  @override
  void initState() {
    super.initState();
    readJsonFile();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   readJsonFile().then((value) {
  //     setState(() {
  //       myPizzas = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Annisa')),
      // body: Text(pizzaString),
      body: ListView.builder(
        itemCount: myPizzas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myPizzas[index].pizzaName),
            subtitle: Text(myPizzas[index].description),
          );
        },
      ),
    );
  }

  // Future readJsonFile() async {
  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');
    // setState(() {
    //   pizzaString = myString;

    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }
    String json = convertToJSON(myPizzas);
    print(json);
    return myPizzas;
  }
}
```

pizza.dart

```
class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;


  Pizza.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      pizzaName = json['pizzaName'],
      description = json['description'],
      price = (json['price'] as num).toDouble(),
      imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
```

pizzalist.json

```
[ 
    { 
      "id": 1, 
      "pizzaName": "Margherita", 
      "description": "Pizza with tomato, fresh mozzarella and basil",
      "price": 8.75, 
      "imageUrl": "images/margherita.png" 
    }, 
    { 
      "id": 2, 
      "pizzaName": "Marinara", 
      "description": "Pizza with tomato, garlic and oregano",
      "price": 7.50, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 3, 
      "pizzaName": "Napoli", 
      "description": "Pizza with tomato, garlic and anchovies",
      "price": 9.50, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 4, 
      "pizzaName": "Carciofi", 
      "description": "Pizza with tomato, fresh mozzarella and artichokes",
      "price": 8.80, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 5, 
      "pizzaName": "Bufala", 
      "description": "Pizza with tomato, buffalo mozzarella and basil",
      "price": 12.50, 
      "imageUrl": "images/marinara.png"  
    }
]
```

pubspec.yaml

```
assets:
    - assets/
```

**Praktikum 2: Handle kompatibilitas data JSON**

Langkah 1: Simulasikan Error

```
[ 
    { 
      "id": "1", 
      "pizzaName": "Margherita", 
      "description": "Pizza with tomato, fresh mozzarella and basil",
      "price": 8.75, 
      "imageUrl": "images/margherita.png" 
    }, 
    { 
      "id": 2, 
      "pizzaName": "Marinara", 
      "description": "Pizza with tomato, garlic and oregano",
      "price": 7.50, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 3, 
      "pizzaName": "Napoli", 
      "description": "Pizza with tomato, garlic and anchovies",
      "price": 9.50, 
      "imageUrl": "null
    }, 
    { 
      "id": 4, 
      "pizzaName": "Carciofi", 
      "description": "Pizza with tomato, fresh mozzarella and artichokes",
      "price": 8.80, 
      "imageUrl": "images/marinara.png"  
    }, 
    { 
      "id": 5, 
      "pizzaName": "Bufala", 
      "description": "Pizza with tomato, buffalo mozzarella and basil",
      "price": 12.50, 
      "imageUrl": "images/marinara.png"  
    }
]
```

Langkah 2: Lihat Error Tipe Data String ke Int

```
"id": "1",
```

Langkah 3: Terapkan tryParse dan Null Coalescing pada ID

```
: id = int.tryParse(json['id'].toString()) ?? 0,
```

Langkah 4: Simulasikan Error Null pada String

```
imageUrl = json['imageUrl'] ?? '';
```

Langkah 5: Terapkan Null Coalescing pada String

```
imageUrl = json['imageUrl'] ?? '';
```

Langkah 6: Gunakan toString() untuk Field String

```
pizzaName = json['pizzaName'].toString(),
description = json['description'].toString(),
```

Langkah 7: Simulasikan Error Tipe Data String ke Double

```
this.price = json[keyPrice];
```

Langkah 8: Terapkan double.tryParse

```
price = double.tryParse(json['price'].toString()) ?? 0.0;`
```

```
imageUrl = json['imageUrl'].toString();
```

Langkah 9: Run dan Perhatikan Output Null

<img width="373" height="500" alt="image" src="https://github.com/user-attachments/assets/2d3b09ee-7e84-4e0e-be48-8979d07c48af" />

Langkah 10: Tambahkan Operator Ternary untuk Output User-Friendly

```
Pizza.fromJson(Map<String, dynamic> json)
    : id = int.tryParse(json['id'].toString()) ?? 0,
      pizzaName =
          json['pizzaName'] != null && json['pizzaName'].toString().isNotEmpty
          ? json['pizzaName'].toString()
          : 'Unknown Pizza',
      description = json['description'] != null
          ? json['description'].toString()
          : 'No description available',
      price = double.tryParse(json['price'].toString()) ?? 0.0,
      imageUrl = json['imageUrl'] ?? '';
```

Langkah 11: Run

Soal 4: Capture hasil running aplikasi Anda, kemudian impor ke laporan praktikum Anda!

<img width="374" height="500" alt="image" src="https://github.com/user-attachments/assets/09eedcfa-6923-45ee-98da-212f16637193" />

**Praktikum 3: Menangani error JSON**

Langkah 1: Buka pizza.dart dan Buat Konstanta

```
const keyId = 'id';
const keyPizzaName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImageUrl = 'imageUrl';
```

Langkah 2: Perbarui fromJson() menggunakan Konstanta

```
  Pizza.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json[keyId].toString()) ?? 0,
        pizzaName = json[keyPizzaName] != null && json[keyPizzaName].toString().isNotEmpty
            ? json[keyPizzaName].toString()
            : 'Unknown Pizza',
        description = json[keyDescription] != null
            ? json[keyDescription].toString()
            : 'No description available',
        price = double.tryParse(json[keyPrice].toString()) ?? 0.0,
        imageUrl = json[keyImageUrl] ?? '';
```

Langkah 3: Perbarui toJson() menggunakan Konstanta

```
  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyPizzaName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImageUrl: imageUrl,
    };
  }
```

Langkah 4: Run

<img width="374" height="500" alt="image" src="https://github.com/user-attachments/assets/cf866f82-344d-415c-a50b-16e71ee09128" />

Soal 5: Jelaskan maksud kode lebih safe dan maintainable!

Kode menjadi lebih aman karena penggunaan `tryParse` dan pengecekan nilai `null` untuk memastikan tidak mengalami crash meskipun data JSON tidak lengkap, kosong, atau memiliki format yang salah. Selain itu, penetapan nilai default pada setiap field menjamin bahwa setiap data selalu memiliki nilai yang stabil, sehingga mengurangi kemungkinan error saat digunakan.

Dari sisi pemeliharaan, kode  lebih mudah diatur. Pemakaian konstanta untuk key JSON, seperti `keyId` atau `keyPizzaName`, mengurangi risiko kesalahan penulisan dan mempermudah perubahan key—cukup dilakukan di satu tempat saja. Struktur fungsi `fromJson()` dan `toJson()` dibuat lebih rapi dan sistematis, sehingga logika konversi data menjadi lebih jelas, mudah dibaca, dan lebih fleksibel ketika ingin menambahkan field baru di masa mendatang.

**Praktikum 4: SharedPreferences**

Langkah 1: Tambahkan Dependensi

```
flutter pub add shared_preferences
```

Langkah 2: Install Dependensi

```
flutter pub get
```

Langkah 3: Lakukan Import

```
import 'package:shared_preferences/shared_preferences.dart';
```

Langkah 4: Tambahkan Variabel appCounter

```
int appCounter = 0;
```

Langkah 5: Buat Method readAndWritePreference

```
Future readAndWritePreference() async {
  }
}
```

Langkah 6: Dapatkan Instance SharedPreferences

```
Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }
```

Langkah 7: Baca, Cek Null, dan Increment Counter

```
appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
```

Langkah 8: Simpan Nilai Baru

```
await prefs.setInt('appCounter', appCounter);
```

Langkah 9: Perbarui State

```
appCounter = appCounter;
```

Langkah 10: Panggil di initState()

```
 @override
  void initState() {
    super.initState();
    readAndWritePreference();
    readJsonFile().then((value) {
      setState(() {
        // myPizzas = value;
        appCounter = appCounter;
      });
    });
  }
```

Langkah 11: Perbarui Tampilan (body)

```
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Annisa')),
      // body: Text(pizzaString),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have opened this app this many times:'),
            Text(
              '$appCounter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Reset Counter'),
            ),
          ],
        ),
      ),
    );
  }
```

Langkah 12: Run

<img width="377" height="500" alt="image" src="https://github.com/user-attachments/assets/a0a93cf1-5e05-4675-8f6e-18b68de4037f" />

Langkah 13: Buat Method deletePreference()

```
  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }
```

Langkah 14: Panggil deletePreference()

```
deletePreference();
```

Langkah 15: Run

<img src="https://github.com/user-attachments/assets/1d5dc815-8675-42e9-a0a3-bfed8092cfc2" width="150"/>

Soal 6 : Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

**Praktikum 5: Akses filesystem dengan path_provider**

Langkah 1: Tambahkan Dependensi

```
flutter pub add path_provider
```

Langkah 2: Lakukan Import

```
import 'package:path_provider/path_provider.dart';
```

Langkah 3: Tambahkan Variabel Path State

```
  String documentPath = '';
  String tempPath = '';
```

Langkah 4: Buat Method getPaths()

```
  Future getPaths() async {
    final docDirectory = await getApplicationDocumentsDirectory();
    final tempDirectory = await getTemporaryDirectory();
    setState(() {
      documentPath = docDirectory.path;
      tempPath = tempDirectory.path;
    });
  }

```

Langkah 5: Panggil getPaths() di initState()

```
  Future getPaths() async {
    final docDirectory = await getApplicationDocumentsDirectory();
    final tempDirectory = await getTemporaryDirectory();
    setState(() {
      documentPath = docDirectory.path;
      tempPath = tempDirectory.path;
    });
  }

```

Langkah 6: Perbarui Tampilan

```
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Document Path: $documentPath'),
            Text('Temporary Path: $tempPath'),
          ],
        ),
      ),
```

Langkah 7: Run

Soal 7 : Capture hasil praktikum Anda dan lampirkan di README.

<img src="/mnt/data/e5847605-e6d4-44e4-ae94-156b49757c2b.png" width="180">

**Praktikum 6: Akses filesystem dengan direktori**

Langkah 1: Lakukan Import dart:io

```
import 'dart:io';
```

Langkah 2: Tambahkan Variabel File dan Text

```
  late File myFile;
  String fileText = '';
```

Langkah 3: Buat Method writeFile()

```
  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }
```

Langkah 4: Inisialisasi File dan Panggil writeFile() di initState()

```
@override
  void initState() {
    // readAndWritePreference();
    getPaths().then((_) {
      myFile = File('$documentPath/pizzas.txt');
      writeFile();
    });
    super.initState();
```

Langkah 5: Buat Method readFile()

```
  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }
```

Langkah 6: Edit build() dan Tambahkan Tombol Baca

```
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Annisa')),
      // body: Text(pizzaString),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Document Path: $documentPath'),
            Text('Temporary Path: $tempPath'),
            ElevatedButton(
              onPressed: () {
                readFile();
              },
              child: const Text('Read File'),
            ),
            Text('File Content: $fileText'),
          ],
        ),
      ),
    );
```

Langkah 7: Run

<img width="371" height="499" alt="image" src="https://github.com/user-attachments/assets/53c93c25-703d-49fa-aeea-582cb9bf0b4f" />


Sol 8 : Jelaskan maksud kode pada langkah 3 dan 7 !Jelaskan maksud kode pada langkah 3 dan 7 !

Pada langkah ketiga, kita menambahkan state isLoading sebagai penanda bahwa proses pengambilan data dari web service sedang berlangsung. Dengan adanya state ini, aplikasi dapat menampilkan indikator loading sehingga pengguna mengetahui bahwa data masih dalam proses dimuat. Selanjutnya, pada langkah ketujuh, data yang berhasil diambil dari API ditampilkan ke antarmuka menggunakan ListView.builder. Komponen ini digunakan agar data dapat ditampilkan secara dinamis dan lebih efisien, terutama ketika jumlah datanya banyak.

**Praktikum 7: Menyimpan data dengan enkripsi/dekripsi**

Langkah 1: Tambahkan Dependensi

```
flutter pub add flutter_secure_storage
```

Langkah 2: Lakukan Import

```
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
```

Langkah 3: Tambahkan Variabel dan Controller

```
final pwdController = TextEditingController();
String myPass = '';
```

Langkah 4: Inisialisasi Secure Storage

```
final pwdController = TextEditingController();
String myPass = '';
```

Langkah 5: Buat Method writeToSecureStorage()

```
  Future writeToSecureStorage() async {
    await stoorge.write(key: myKey, value: pwdController.text);
  }
```

Langkah 6: Buat Method readFromSecureStorage()

```
  Future<String?> readFromSecureStorage() async {
    String secret = await stoorge.read(key: myKey) ?? '';
    return secret;
  }
```

Langkah 7: Edit build() untuk UI dan Logic

```
body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(controller: pwdController),
          ElevatedButton(
            child: const Text('Save Value'),
            onPressed: () {
              writeToSecureStorage();
            },
          ),
        ],
```

Langkah 8: Hubungkan Read ke Tombol

```
ElevatedButton(
              child: const Text('Read Value'),
              onPressed: () {
                readFromSecureStorage().then((value) {
                  setState(() {
                    myPass = value ?? '';
                  });
                });
              },
            ),
            Text('$myPass'),
```

Langkah 9: Run

Soal 9 : Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

<img src="https://github.com/user-attachments/assets/2364b724-5b65-481d-ac7e-7e6caafb228c" width="150">












