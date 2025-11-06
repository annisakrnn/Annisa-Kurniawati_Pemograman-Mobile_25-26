import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo Annisa Kurniawati / 2341720070',
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
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
                //langlah 2 praktikum 4
                returnFG();
                //Langkah 3 Praktikum 3
                // getNumber()
                //     .then((value) {
                //       setState(() {
                //         result = value.toString();
                //       });
                //       //langkah 6 praktikum 3
                //     })
                //     .catchError((e) {
                //       result = 'An error occurred';
                //     });
                //Langkah 5 Praktikum 1
                //   setState(() {});
                //   getData()
                //       .then((value) {
                //         result = value.body.toString().substring(0, 450);
                //         setState(() {});
                //       })
                //       .catchError((error) {
                //         result = 'An error occurred';
                //         setState(() {});
                //       });
                // },
                //Langkah 3 Praktikum 2
                // count();
              },
            ),
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

  late Completer completer;
  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;
  }

  calculate() async {
    //langkah 3 praktikum 3
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
      //throw Exception();
    } catch (e) {
      completer.completeError({});
    }
    //langkah 2 praktikum 3
    // await Future.delayed(const Duration(seconds: 5));
    // completer.complete(42);
  }

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

  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/0Xhtf6-BAqcC';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

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

  Future count() async {
    int total = 0;
    total += await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {
      result = total.toString();
    });
  }
}
