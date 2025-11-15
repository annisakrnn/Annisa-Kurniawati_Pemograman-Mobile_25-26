import 'dart:async';

import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}

class NumberStream {
  final StreamController<int> _controller = StreamController<int>();
  StreamController<int> get controller => _controller;

  void addNumberToSink(int number) {
    _controller.sink.add(number);
  }

  close() {
    _controller.close();
  }

  addError() {
    controller.sink.addError('error');
  }
}
