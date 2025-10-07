import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item item = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        backgroundColor: const Color.fromARGB(255, 228, 124, 124),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SingleChildScrollView(
          // Tambahkan SingleChildScrollView agar bisa di scroll
          child: Card(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Hero(
                                tag: item.photo.toString(),
                                child: Image.asset(
                                  item.photo.toString(),
                                  width: 200,
                                  height: 300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 228, 124, 179),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              // Text('${item.pages} pages'),
                              // const SizedBox(height: 30),
                              Row(
                                children: [
                                  const Text('Stok : '),
                                  Text(item.stock.toString()),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    (i < item.rating)
                                        ? const Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Colors.amber,
                                          )
                                        : const Icon(
                                            Icons.star,
                                            size: 15,
                                            color: Colors.black,
                                          ),
                                  const Padding(padding: EdgeInsets.all(3.0)),
                                  Text(item.rating.toString()),
                                ],
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                      255, 228, 124, 179), // Warna tombol
                                ),
                                child: Text(
                                  'Purchase for Rp${item.price}',
                                  style: const TextStyle(
                                    color: Colors
                                        .white, // Warna teks menjadi putih
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
