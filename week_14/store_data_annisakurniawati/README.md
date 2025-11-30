Nama: Annisa Kurniawati

NIM: 2341720070

Kelas: TI/3H

**Praktikum 1: Membuat layanan Mock API**

Daftar untuk layanan Mock Lab dihttps://app.wiremock.cloud/ dan Masuk ke layanan tersebut, buka "Example Mock API", dan klik pada bagian Stubs dari API contoh. Kemudian, klik pada entri pertama—yaitu, Get a JSON resource.

<img width="1920" height="1080" alt="Screenshot 2025-11-27 133218" src="https://github.com/user-attachments/assets/94d1a9e0-ae7f-406c-8abe-2e16bf2a3827" />

Klik pada tombol New. Untuk Namanya, ketik Pizza List, biarkan GET sebagai verb, dan di kotak teks di dekat verb GET, ketik /pizzalist. Kemudian, di bagian Response, untuk status 200, pilih JSON sebagai format dan tempel konten JSON yang tersedia dihttps://bit.ly/pizzalist. dan tekan tombol save

<img width="1920" height="1080" alt="Screenshot 2025-11-27 133218" src="https://github.com/user-attachments/assets/9cf789de-17a5-4659-b945-f4f1e40c7924" />


Kembali ke proyek Flutter Anda, tambahkan dependensi http dengan mengetik di Terminal Anda:

```
flutter pub add http
```

Di file httphelper.dart, tambahkan kode berikut:

```
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'model/pizza.dart';

class HttpHelper {
  final String authority = 'ev241.wiremockapi.cloud';
  final String path = '/pizzalist';
  static final HttpHelper _httpHelper = HttpHelper._internal();
  HttpHelper._internal();
  factory HttpHelper() {
    return _httpHelper;
  }

  Future<List<Pizza>> getPizzaList() async {
    final Uri url = Uri.https(authority, path);
    final http.Response result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      //provide a type argument to the map method to avoid type
      //error
      List<Pizza> pizzas = jsonResponse
          .map<Pizza>((i) => Pizza.fromJson(i))
          .toList();
      return pizzas;
    } else {
      return [];
    }
  }
}
```

Di file main.dart, di kelas _MyHomePageState, tambahkan metode bernama callPizzas.

```
Future<List<Pizza>> callPizzas() async {
  HttpHelper helper = HttpHelper(); 
  List<Pizza> pizzas = await helper.getPizzaList(); 
  return pizzas; 
}
```

Di metode build dari kelas _MyHomePageState, di body Scaffold, tambahkan FutureBuilder yang membangun ListView dari widget ListTile yang berisi objek Pizza

```
Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(title: const Text('JSON')),
      body: FutureBuilder(
          future: callPizzas(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> 
snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
            return ListView.builder(
                itemCount: (snapshot.data == null) ? 0 : snapshot.
data!.length,
                itemBuilder: (BuildContext context, int position) {
                  return ListTile(
                    title: Text(snapshot.data![position].pizzaName),
                    subtitle: Text(snapshot.data![position].
description +
                        ' - € ' +
                        snapshot.data![position].price.toString()),
                  );
                });
          }),
    );  
}
```

Jalankan aplikasi. Anda harus melihat layar yang mirip dengan berikut ini:

<img width="376" height="501" alt="Screenshot 2025-11-27 144839" src="https://github.com/user-attachments/assets/f3e908b4-3ef3-4417-a070-8a1e6557228b" />

Soal 1: Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda dan gantilah warna tema aplikasi sesuai kesukaan Anda.

```
appBar: AppBar(title: const Text('JSON Annisa')),
theme: ThemeData(primarySwatch: Colors.pink),
```
Di file httphelper.dart, tambahkan kode berikut ke kelas HttpHelper, tepat di bawah deklarasi:

```
static final HttpHelper _httpHelper = HttpHelper._internal();
HttpHelper._internal();
factory HttpHelper() {
    return _httpHelper;
}
```

**Praktikum 2: Mengirim Data ke Web Service (POST)**

Masuk ke layanan Mock Lab dihttps://app.wiremock.cloud/ dan klik pada bagian Stubs dari API contoh. Kemudian, buat stub baru dan save

<img width="917" height="443" alt="image" src="https://github.com/user-attachments/assets/20b7e6a4-0f45-4ce4-ae09-b549b241cbdf" />

Di proyek Flutter, di file httphelper.dart, di kelas HttpHelper, buat metode baru bernama postPizza, sebagai berikut

```
Future<String> postPizza(Pizza pizza) async {
  const postPath = '/pizza';
  String post = json.encode(pizza.toJson());
  Uri url = Uri.https(authority, postPath);
  http.Response r = await http.post(
    url,
    body: post,
  );
  return r.body;
}
```

Di proyek, buat file baru bernama pizza_detail.dart dan Di bagian atas file baru, tambahkan impor yang diperlukan:

```
import 'package:flutter/material.dart';
import 'pizza.dart';
import 'httphelper.dart';
```

Buat StatefulWidget bernama PizzaDetailScreen:

```class PizzaDetailScreen extends StatefulWidget {
  const PizzaDetailScreen({super.key});
  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
```

Di bagian atas kelas _PizzaDetailScreenState, tambahkan lima TextEditingController. Ini akan berisi data untuk objek Pizza yang akan diposting nanti. Juga, tambahkan String yang akan berisi hasil dari permintaan POST:

```
final TextEditingController txtId = TextEditingController();
final TextEditingController txtName = TextEditingController();
final TextEditingController txtDescription = TextEditingController();
final TextEditingController txtPrice = TextEditingController();
final TextEditingController txtImageUrl = TextEditingController();
String operationResult = '';
```

Override metode dispose() untuk membuang controller:

```
@override
void dispose() {
  txtId.dispose();
  txtName.dispose();
  txtDescription.dispose();
  txtPrice.dispose();
  txtImageUrl.dispose();
  super.dispose();
}
```

Di metode build() dari kelas, kembalikan Scaffold, yang AppBar-nya berisi Text "Pizza Detail" dan body-nya berisi Padding dan SingleChildScrollView yang berisi Column

```
return Scaffold(
  appBar: AppBar(
    title: const Text('Pizza Detail'),
  ),
  body: Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(children: []),
      )));
```

Untuk properti children dari Column, tambahkan beberapa Text yang akan berisi hasil dari post, lima TextField, masing-masing terikat ke TextEditingController mereka sendiri, dan ElevatedButton untuk menyelesaikan aksi POST (metode postPizza akan dibuat selanjutnya). Juga, tambahkan SizedBox untuk menjauhkan widget di layar

```
Text(
  operationResult,
  style: TextStyle(
      backgroundColor: Colors.green[200],
      color: Colors.black),
),
const SizedBox(
  height: 24,
),
TextField(
  controller: txtId,
  decoration: const InputDecoration(hintText: 'Insert ID'),
),
const SizedBox(
  height: 24,
),
TextField(
  controller: txtName,
  decoration: const InputDecoration(hintText: 'Insert Pizza Name'),
),
const SizedBox(
  height: 24,
),
TextField(
  controller: txtDescription,
  decoration: const InputDecoration(hintText: 'Insert Description'),
),
const SizedBox(
  height: 24,
),
TextField(
  controller: txtPrice,
  decoration: const InputDecoration(hintText: 'Insert Price'),
),
const SizedBox(
  height: 24,
),
TextField(
  controller: txtImageUrl,
  decoration: const InputDecoration(hintText: 'Insert Image Url'),
),
const SizedBox(
  height: 48,
),
ElevatedButton(
    child: const Text('Send Post'),
    onPressed: () {
      postPizza();
    })
```

Di bagian bawah kelas _PizzaDetailScreenState, tambahkan metode postPizza:
Future postPizza

```
Future postPizza() async {
  HttpHelper helper = HttpHelper();
  Pizza pizza = Pizza();
  pizza.id = int.tryParse(txtId.text);
  pizza.pizzaName = txtName.text;
  pizza.description = txtDescription.text;
  pizza.price = double.tryParse(txtPrice.text);
  pizza.imageUrl = txtImageUrl.text;
  String result = await helper.postPizza(pizza);
  setState(() {
    operationResult = result;
  });
}
```

Di file main.dart, impor file pizza_detail.dart dan Di Scaffold dari metode build() kelas _MyHomePageState, tambahkan FloatingActionButton yang akan navigasi ke rute PizzaDetail

```
floatingActionButton: FloatingActionButton(
  child: const Icon(Icons.add),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const PizzaDetailScreen()),
    );
  }),
```

Jalankan aplikasi. Di layar utama, tekan FloatingActionButton untuk navigasi ke rute PizzaDetail

<img width="374" height="497" alt="image" src="https://github.com/user-attachments/assets/b8662f45-f148-4cbe-b958-1c7c73424ec8" />

Soal 2: Tambahkan field baru dalam JSON maupun POST ke Wiremock!

```
{
  "id": "${json-unit.any-number}",
  "pizzaName": "${json-unit.any-string}",
  "description": "${json-unit.any-string}",
  "price": "${json-unit.any-number}",
  "imageUrl": "${json-unit.any-string}"
  "rating": {{jsonPath request.body '$.rating' default='0'}}"
}
```

**Praktikum 3: Memperbarui Data di Web Service (PUT)**

Masuk ke layanan Wiremock dihttps://app.wiremock.cloud dan klik pada bagian Stubs dari API contoh. Kemudian, buat stub baru dan save

<img width="485" height="385" alt="image" src="https://github.com/user-attachments/assets/9d8fdcf7-0503-44b6-9030-69f93738b16b" />

Di proyek Flutter, tambahkan metode putPizza ke kelas HttpHelper di file http_helper.dart:

```
Future<String> putPizza(Pizza pizza) async {
  const putPath = '/pizza';
  String put = json.encode(pizza.toJson());
  Uri url = Uri.https(authority, putPath);
  http.Response r = await http.put(
    url,
    body: put,
  );
  return r.body;
}
```

Di kelas PizzaDetailScreen di file pizza_detail.dart, tambahkan dua properti, sebuah Pizza dan sebuah boolean, dan di konstruktor, atur kedua properti tersebut

```
final Pizza pizza;
final bool isNew;
const PizzaDetailScreen(
    {super.key, required this.pizza, required this.isNew});
```

Di kelas PizzaDetailScreenState, override metode initState. Ketika properti isNew dari kelas PizzaDetail bukan baru, itu mengatur konten TextField dengan nilai-nilai objek Pizza yang diteruskan:

```
@override
void initState() {
  if (!widget.isNew) {
    txtId.text = widget.pizza.id.toString();
    txtName.text = widget.pizza.pizzaName;
    txtDescription.text = widget.pizza.description;
    txtPrice.text = widget.pizza.price.toString();
    txtImageUrl.text = widget.pizza.imageUrl;
  }
  super.initState();
}
```

Edit metode savePizza sehingga memanggil metode helper.postPizza ketika isNew benar, dan helper.putPizza ketika salah

```
Future savePizza() async {
...
    final result = await (widget.isNew
  ? helper.postPizza(pizza)
  : helper.putPizza(pizza));    
  setState(() {
      operationResult = result;
    });
  }
```

Di file main.dart, di metode build dari _MyHomePageState, tambahkan properti onTap ke ListTile sehingga ketika pengguna mengetuknya, aplikasi akan mengubah rute dan menampilkan layar PizzaDetail, meneruskan pizza saat ini dan false untuk parameter isNew

```
return ListTile(
    title: Text(pizzas.data![position].pizzaName),
    subtitle: Text(pizzas.data![position].description +
                  ' - € ' +
                  pizzas.data![position].price.toString()),
    onTap: () {
       Navigator.push(
          context,
          MaterialPageRoute(
             builder: (context) => PizzaDetailScreen(
                pizza: pizzas.data![position], isNew: false)),
    );
```

Di floatingActionButton, teruskan Pizza baru dan true untuk parameter isNew ke rute PizzaDetail

```
floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PizzaDetailScreen(
                        pizza: Pizza(),
                        isNew: true,
                      )),            
           );
      }),
);
```

Jalankan aplikasi. Di layar utama, ketuk dan edit Pizza apa pun untuk navigasi ke rute PizzaDetail.

Soal 3: Ubah salah satu data dengan Nama dan NIM Anda, lalu perhatikan hasilnya di Wiremock.

<img width="377" height="503" alt="image" src="https://github.com/user-attachments/assets/1a3e5e70-e311-4234-8630-c00b01470ebe" />

<img width="960" height="540" alt="image" src="https://github.com/user-attachments/assets/e5e44559-fc0e-4997-a428-e0208b51667c" />

**Praktikum 4: Menghapus Data dari Web Service (DELETE)**

Masuk ke layanan Wiremock dihttps://app.wiremock.cloud dan klik pada bagian Stubs dari API contoh. Kemudian, buat stub baru dan save

<img width="511" height="416" alt="image" src="https://github.com/user-attachments/assets/2788d700-38cb-41b8-ba77-a0a3f6d7c7cf" />

Di proyek Flutter, tambahkan metode deletePizza ke kelas HttpHelper di file http_helper.dart

```
Future<String> deletePizza(int id) async {
  const deletePath = '/pizza';
  Uri url = Uri.https(authority, deletePath);
  http.Response r = await http.delete(
    url,
  );
  return r.body;
}
```

Di file main.dart, di metode build dari kelas _MyHomePageState, refactor itemBuilder dari ListView.builder sehingga ListTile terkandung dalam widget Dismissible, sebagai berikut

```
return ListView.builder(
            itemCount: pizzas.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(pizzas[index].id.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) async {
                  HttpHelper helper = HttpHelper();

                  int deleteId = pizzas[index].id!;
                  setState(() {
                    pizzas.removeAt(index);
                  });

                  await helper.deletePizza(deleteId);
                },
```

Soal 4: Capture hasil aplikasi Anda berupa GIF di README dan lakukan commit hasil jawaban Soal 4 dengan pesan "W14: Jawaban Soal 4"

<img width="367" height="503" alt="image" src="https://github.com/user-attachments/assets/f2f11dd7-d5e7-4e15-a4a2-a11fd4fbbd30" />











