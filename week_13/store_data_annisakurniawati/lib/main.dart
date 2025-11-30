import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_data_annisakurniawati/httphelper.dart';

import 'model/pizza.dart';
import 'pizza_detail.dart';

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
  String documentPath = '';
  String tempPath = '';
  int appCounter = 0;
  String pizzaString = '';
  late File myFile;
  String fileText = '';
  final pwdController = TextEditingController();
  String myPass = '';
  final stoorge = const FlutterSecureStorage();
  final myKey = 'myPass';
  List<Pizza> myPizzas = [];

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  @override
  void initState() {
    getPaths().then((_) {
      myFile = File('$documentPath/pizzas.txt');
      writeFile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('JSON Annisa')),
      body: FutureBuilder(
        future: callPizzas(),
        builder: (context, AsyncSnapshot<List<Pizza>> snapshot) {
          if (snapshot.hasError) {
            return Text('ERROR: ${snapshot.error}');
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          List<Pizza> pizzas = snapshot.data!;

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

                child: ListTile(
                  title: Text(pizzas[index].pizzaName),
                  subtitle: Text(
                    '${pizzas[index].description} - € ${pizzas[index].price}',
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PizzaDetailScreen(
                          pizza: pizzas[index],
                          isNew: false,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PizzaDetailScreen(
                pizza: Pizza(
                  id: 0,
                  pizzaName: "",
                  description: "",
                  price: 0.0,
                  imageUrl: "",
                ),
                isNew: true,
              ),
            ),
          );
        },
      ),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(
      context,
    ).loadString('assets/pizzalist.json');

    List pizzaMapList = jsonDecode(myString);
    List<Pizza> myPizzas = [];

    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }

    return myPizzas;
  }

  Future readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;
    await prefs.setInt('appCounter', appCounter);
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  Future getPaths() async {
    final docDirectory = await getApplicationDocumentsDirectory();
    final tempDirectory = await getTemporaryDirectory();
    setState(() {
      documentPath = docDirectory.path;
      tempPath = tempDirectory.path;
    });
  }

  Future<bool> writeFile() async {
    try {
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

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

  Future writeToSecureStorage() async {
    await stoorge.write(key: myKey, value: pwdController.text);
  }

  Future<String?> readFromSecureStorage() async {
    String secret = await stoorge.read(key: myKey) ?? '';
    return secret;
  }

  Future<List<Pizza>> callPizzas() async {
    HttpHelper helper = HttpHelper();
    return await helper.getPizzaList();
  }
}
