import 'package:flutter/material.dart';

class BackgroundTwitterWidget extends StatelessWidget {
  const BackgroundTwitterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: buildDecoration(),
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image(
                image: AssetImage(
                  'twitter-white-logo.png',
                ),
                width: 400,
              ),
            ),
          ),
        ));
  }

  BoxDecoration buildDecoration() {
    return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('twitter-bg.png'), fit: BoxFit.cover));
  }
}
