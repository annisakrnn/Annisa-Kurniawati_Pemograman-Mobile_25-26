import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //Langkah 2
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
              const Text(
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
          child: const Row(
            children: [
              Icon(
                Icons.star, // Ikon bintang
                color: Colors.red, // Warna merah
              ),
              Text('41'), // Teks "41"
            ],
          ),
        ),
      ],
    ),
  );
  //Praktikum 3 Langkah 1
  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: const Text(
      'Wisata petualang kini sedang diperkenalkan Pemerintah Provinsi Jawa Timur (Pemprov Jatim)'
      'Adalah menjajal serunya berwisata sekaligus berpetualang di Bukit Jengkoang di Kota Batu.'
      'Bukan sembarangan, Bukit Jengkoang ini tak hanya menawarkan pemandangan alam indah,'
      'tapi juga memiliki wisata petualangan seru. Dengan menggunakan mobil jeep terbuka,'
      'wisatawan diajak off road menuju Bukit Jengkoang.'
      '(Annisa Kurniawati 2341720070)🙂.',
      softWrap: true,
      style: TextStyle(fontSize: 16, color: Colors.black),
    ),
  );

  MyApp({super.key});
  //Langkah 1
  @override
  Widget build(BuildContext context) {
    //Button Section Praktikum 2 Langkah 2
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
      title: 'Flutter layout: Annisa Kurniawati 2341720070',
      home: Scaffold(
        appBar: AppBar(title: const Text('My App')),
        body: ListView(
          children: [
            Image.asset(
              'asset/img1.png',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection, //Praktikum 2 Langkah 3
            textSection, //Praktikum 3 Langkah 2
          ],
        ),
      ),
    );
  }

  //Praktikum 2 Langkah 1
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
