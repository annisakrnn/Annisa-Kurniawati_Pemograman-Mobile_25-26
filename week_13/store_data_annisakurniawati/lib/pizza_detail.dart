import 'package:flutter/material.dart';

import 'httphelper.dart';
import 'model/pizza.dart';

class PizzaDetailScreen extends StatefulWidget {
  final Pizza pizza;
  final bool isNew;

  const PizzaDetailScreen({
    super.key,
    required this.pizza,
    required this.isNew,
  });

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtPrice = TextEditingController();
  final TextEditingController txtImageUrl = TextEditingController();

  String operationResult = '';

  @override
  void initState() {
    super.initState();

    if (!widget.isNew) {
      txtId.text = widget.pizza.id.toString();
      txtName.text = widget.pizza.pizzaName;
      txtDescription.text = widget.pizza.description;
      txtPrice.text = widget.pizza.price.toString();
      txtImageUrl.text = widget.pizza.imageUrl;
    }
  }

  @override
  void dispose() {
    txtId.dispose();
    txtName.dispose();
    txtDescription.dispose();
    txtPrice.dispose();
    txtImageUrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pizza Detail')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(operationResult),
              const SizedBox(height: 24),

              TextField(
                controller: txtId,
                decoration: const InputDecoration(hintText: 'Insert ID'),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: txtName,
                decoration: const InputDecoration(
                  hintText: 'Insert Pizza Name',
                ),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: txtDescription,
                decoration: const InputDecoration(
                  hintText: 'Insert Description',
                ),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: txtPrice,
                decoration: const InputDecoration(hintText: 'Insert Price'),
              ),
              const SizedBox(height: 24),

              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(hintText: 'Insert Image Url'),
              ),
              const SizedBox(height: 48),

              ElevatedButton(
                onPressed: savePizza, // ⬅ DI SINI
                child: const Text('Save Pizza'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ⭐ Fungsi baru: POST kalau isNew, PUT kalau edit
  Future savePizza() async {
    HttpHelper helper = HttpHelper();

    Pizza pizza = Pizza.fromJson({
      "id": int.tryParse(txtId.text) ?? 0,
      "pizzaName": txtName.text,
      "description": txtDescription.text,
      "price": double.tryParse(txtPrice.text) ?? 0,
      "imageUrl": txtImageUrl.text,
    });

    final result = await (widget.isNew
        ? helper.postPizza(pizza)
        : helper.putPizza(pizza));

    setState(() {
      operationResult = result;
    });
  }

  // Tetap disimpan jika kamu ingin manual POST
  Future postPizza() async {
    HttpHelper helper = HttpHelper();

    Pizza pizza = Pizza.fromJson({
      "id": txtId.text,
      "pizzaName": txtName.text,
      "description": txtDescription.text,
      "price": txtPrice.text,
      "imageUrl": txtImageUrl.text,
    });

    String result = await helper.postPizza(pizza);

    setState(() {
      operationResult = result;
    });
  }
}
