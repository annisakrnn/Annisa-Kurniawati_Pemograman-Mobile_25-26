import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Second Annisa')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Pink'),
              onPressed: () {
                color = Colors.pink.shade600;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Brown'),
              onPressed: () {
                color = Colors.brown.shade300;
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                color = Colors.blue.shade300;
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}
