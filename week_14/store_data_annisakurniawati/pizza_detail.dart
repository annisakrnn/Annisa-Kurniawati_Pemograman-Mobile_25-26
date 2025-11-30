import 'package:flutter/material.dart';

import 'lib/httphelper.dart';
import 'lib/model/pizza.dart ';

// Controllers
final TextEditingController txtId = TextEditingController();
final TextEditingController txtName = TextEditingController();
final TextEditingController txtDescription = TextEditingController();
final TextEditingController txtPrice = TextEditingController();
final TextEditingController txtImageUrl = TextEditingController();
String operationResult = '';

class PizzaDetailScreen extends StatefulWidget {
  const PizzaDetailScreen({super.key});
  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
  String operationResult = '';

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
      appBar: AppBar(title: const Text("Pizza Detail")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                operationResult,
                style: TextStyle(
                  backgroundColor: Colors.green[200],
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 24),

              TextField(
                controller: txtId,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Insert ID",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              TextField(
                controller: txtName,
                decoration: const InputDecoration(
                  labelText: "Insert Pizza Name",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              TextField(
                controller: txtDescription,
                decoration: const InputDecoration(
                  labelText: "Insert Description",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              TextField(
                controller: txtPrice,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Insert Price",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              TextField(
                controller: txtImageUrl,
                decoration: const InputDecoration(
                  labelText: "Insert Image URL",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 48),

              ElevatedButton(
                onPressed: () {
                  _postPizza();
                },
                child: const Text("Send Post"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _postPizza() async {
    HttpHelper helper = HttpHelper();

    Pizza pizza = Pizza();
    pizza.id = int.tryParse(txtId.text);
    pizza.pizzaName = txtName.text;
    pizza.description = txtDescription.text;
    pizza.price = double.tryParse(txtPrice.text);
    pizza.imageUrl = txtImageUrl.text;

    String result = await helper.postPizza(pizza);

    setState(() {
      operationResult = result;
    });
  }
}
