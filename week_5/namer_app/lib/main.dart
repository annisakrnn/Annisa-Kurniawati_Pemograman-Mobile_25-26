import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  //Tambah method getNext
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  //Menambahkan code
  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    //Menambahkan icon favorite
    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair), // Mengganti Text dengan BigCard
            SizedBox(height: 10), // Menambahkan jarak antara kartu dan tombol
            //Menambah tombol next
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Memindahkan tombol favorite ke kiri
                ElevatedButton.icon(
                  onPressed: () {
                    appState
                        .toggleFavorite(); // Memanggil method toggleFavorite
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext(); // Memanggil method getNext
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({super.key, required this.pair});
  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Mendapatkan tema saat ini
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme
          .colorScheme
          .onPrimary, // Menggunakan warna teks yang sesuai dengan warna utama
    );
    return Card(
      color: theme.colorScheme.primary, // Menggunakan warna utama dari tema
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
