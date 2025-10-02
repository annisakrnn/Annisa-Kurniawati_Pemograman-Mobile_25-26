import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// langkah 4
Widget titleSection = Container(
  padding: const EdgeInsets.all(32.0),
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Jawaban soal 1
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8.0), // Jawaban soal 2
              child: const Text(
                'Wisata Gunung di Batu',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Batu, Malang, Indonesia',
              style: TextStyle(
                color: Colors.grey, // Warna abu-abu
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(32.0), // Jawaban soal 3
        child: Row(
          children: [
            Icon(
              Icons.star, // Ikon bintang
              color: Colors.red, // Warna merah
            ),
            const Text('41'), // Teks "41"
          ],
        ),
      ),
    ],
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //langkah 2
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Ratnasari 2241720007',
      home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
        body: Column(children: [titleSection]),
      ),
    );
  }
}
