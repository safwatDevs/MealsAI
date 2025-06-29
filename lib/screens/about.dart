import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_ai/widgets/bullet_point_item.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});
  final mainColor = Color.fromARGB(255, 250, 188, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Meals AI',
          style: GoogleFonts.splineSans(fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Meals AI is your smart kitchen companion, designed to turn your everyday ingredients into delicious meals using the power of artificial intelligence.',
              style: GoogleFonts.splineSans(color: Colors.black, fontSize: 18),
            ),
            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.left,
                'With Meals AI you Can:',
                style: GoogleFonts.splineSans(
                  color: mainColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BulletPointItem('Capture ingredients with your camera'),
            SizedBox(height: 10),
            BulletPointItem('Generate recipes powered by advanced AI'),
            SizedBox(height: 10),
            BulletPointItem('Save your favorite meals for quick access'),
            SizedBox(height: 10),
            BulletPointItem(
              'Track your personal cooking history across sessions',
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
