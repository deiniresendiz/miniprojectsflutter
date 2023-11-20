import 'package:flutter/material.dart';

class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Icon(
          Icons.notifications_none_outlined,
          color: Colors.grey,
        ),
        Positioned(
            left: 2,
            child: Container(
              height: 5,
              width: 5,
              decoration: buildBoxDecoration(),
            ))
      ]),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(100), color: Colors.red);
}
