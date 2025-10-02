import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  //langkah 2

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Annisa Kurniawati / 2341720070',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
