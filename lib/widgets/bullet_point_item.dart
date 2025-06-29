import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BulletPointItem extends StatelessWidget {
  BulletPointItem(
    this.text, {
    super.key,
    this.bulletColor = const Color.fromARGB(255, 250, 188, 0),
    this.fontSize = 18,
    this.textColor = Colors.black,
  });
  String text;
  Color bulletColor;
  double fontSize;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '• ',
          style: TextStyle(color: bulletColor, fontSize: fontSize * 1.5),
        ),
        Padding(
          padding: EdgeInsets.only(top: fontSize / 6),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Text(
              text,
              style: GoogleFonts.splineSans(
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
