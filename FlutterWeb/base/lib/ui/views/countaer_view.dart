import 'package:base/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  final String base;
  const CounterView({super.key, this.base = '5'});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _counter = 5;

  @override
  void initState() {
    super.initState();
    if (int.tryParse(widget.base) != null) _counter = int.parse(widget.base);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'contador sateful',
          style: TextStyle(fontSize: 20),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Contador: $_counter',
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
              onPressed: () => setState(() => _counter++),
              text: 'incrementar',
            ),
            CustomFlatButton(
              onPressed: () => setState(() => _counter--),
              text: 'decrementar',
            ),
          ],
        ),
        Spacer()
      ],
    );
  }
}
