import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 15;
  CounterProvider(String base) {
    if (int.tryParse(base) != null) this._counter = int.parse(base);
  }

  int get counter => this._counter;

  void increment() {
    this._counter++;
    notifyListeners();
  }

  void decrement() {
    this._counter--;
    notifyListeners();
  }
}
