import 'package:base/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class View404 extends StatelessWidget {
  const View404({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('404', style: TextStyle(fontSize: 40)),
        SizedBox(height: 10),
        const Text('No se encontro la pagina'),
        CustomFlatButton(
          onPressed: () => Navigator.pushNamed(context, '/sateful'),
          text: 'Regresar',
        )
      ],
    ));
  }
}
