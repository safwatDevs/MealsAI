import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_ai/auth_service.dart';
import 'package:meals_ai/screens/about.dart';
import 'package:meals_ai/widgets/custom_button.dart';
import 'package:meals_ai/widgets/custom_text_field.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<StatefulWidget> {
  final auth = AuthService();
  bool isSignUp = false;
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final brown = Color.fromARGB(255, 89, 36, 0);
  void toggle() {
    setState(() {
      isSignUp = !isSignUp;
    });
  }

  void authenticate() async {
    if (isSignUp) {
      setState(() async {
        await auth.signUp(context, username.text, email.text, password.text);
      });
    } else {
      setState(() {
        auth.signIn(context, email.text, password.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 250, 247, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(252, 250, 247, 1),
        title: Text(
          'Meals AI',
          style: GoogleFonts.splineSans(
            fontWeight: FontWeight.bold,
            color: brown,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            },
            icon: FaIcon(FontAwesomeIcons.circleQuestion, color: brown),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: Text(
                'Welcome to Meals AI',
                textAlign: TextAlign.center,
                style: GoogleFonts.splineSans(
                  color: const Color.fromARGB(255, 89, 36, 0),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onHorizontalDragEnd: (details) {
                setState(() {
                  isSignUp = !isSignUp;
                });
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(245, 240, 229, 1),
                    ),
                    width: double.infinity,
                    height: 50,
                  ),
                  AnimatedPositioned(
                    duration: const Duration(microseconds: 1000),
                    curve: Curves.easeInOut,
                    top: 6,
                    bottom: 6,
                    left: isSignUp ? null : 6,
                    right: isSignUp ? 6 : null,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    top: 0,
                    left: MediaQuery.of(context).size.width * 0.155,
                    right: MediaQuery.of(context).size.width * 0.155,
                    child: Row(
                      children: [
                        Text(
                          'Sign In',
                          style: GoogleFonts.splineSans(
                            color: isSignUp
                                ? Color.fromRGBO(158, 135, 71, 1)
                                : Colors.black,
                            fontSize: 17,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Sign Up',
                          style: GoogleFonts.splineSans(
                            color: isSignUp
                                ? Colors.black
                                : Color.fromRGBO(158, 135, 71, 1),
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            if (isSignUp) CustomTextField('Username', username, false),
            SizedBox(height: 20),
            CustomTextField('Email', email, false),
            SizedBox(height: 20),
            CustomTextField('Password', password, true),
            SizedBox(height: 20),
            CustomButton(
              isSignUp ? 'Sign Up' : 'Sign In',
              onPressed: authenticate,
            ),
          ],
        ),
      ),
    );
  }
}
