import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContractView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purple,
        child: Center(
            child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'ContractV',
            style: GoogleFonts.montserratAlternates(
              fontSize: 80,
              fontWeight: FontWeight.bold,
            ),
          ),
        )));
  }
}
