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
    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    return MaterialApp(
      title: 'Flutter layout: Anniss Kurniawati 2341720070',
      home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
        body: Column(children: [titleSection, buttonSection]),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
