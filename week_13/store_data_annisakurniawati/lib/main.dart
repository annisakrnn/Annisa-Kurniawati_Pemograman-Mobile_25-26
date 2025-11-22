import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String documentPath = '';
  String tempPath = '';
  int appCounter = 0;
  String pizzaString = '';
  late File myFile;
  String fileText = '';
  List<Pizza> myPizzas = [];
  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => jsonEncode(pizza)).toList());
  }

  // @override
  // void initState() {
  //   super.initState();
  //   readJsonFile();
  // }

  @override
  void initState() {
    // readAndWritePreference();
    getPaths().then((_) {
      myFile = File('$documentPath/pizzas.txt');
      writeFile();
    });
    super.initState();

    // readJsonFile().then((value) {
    //   setState(() {
    //     // myPizzas = value;
    //     appCounter = appCounter;
    //   });
    // });
  }

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
}
