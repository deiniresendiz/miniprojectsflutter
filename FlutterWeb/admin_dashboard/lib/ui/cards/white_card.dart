import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhiteCard extends StatelessWidget {
  final String? text;
  final Widget child;
  final double? width;

  const WhiteCard({super.key, this.text, required this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(10),
      decoration: buildBoxDecoration(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (text != null) ...[
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              text!,
              style:
                  GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Divider()
        ],
        child
      ]),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
            )
          ]);
}
