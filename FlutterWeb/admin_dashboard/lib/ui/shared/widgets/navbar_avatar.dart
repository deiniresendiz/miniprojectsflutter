import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network(
            'https://pics.craiyon.com/2023-07-15/dc2ec5a571974417a5551420a4fb0587.webp'),
        width: 30,
        height: 30,
      ),
    );
  }
}
