import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_ai/screens/about.dart';
import 'package:meals_ai/screens/auth_screen.dart';
import 'package:meals_ai/screens/home_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<StatefulWidget> {
  Future<User?> getCurrentUser() async {
    final session = Supabase.instance.client.auth.currentSession;
    return session?.user;
  }

  final brown = Color.fromARGB(255, 89, 36, 0);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = Supabase.instance.client.auth.currentSession;

        // While checking auth state
        if (!snapshot.hasData && session == null) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(252, 250, 247, 1),
              title: Text(
                'Meals AI',
                style: GoogleFonts.splineSans(
                  fontWeight: FontWeight.bold,
                  color: brown,
                ),
              ),
            ),
            body: Center(child: CircularProgressIndicator(color: brown)),
          );
        }

        // If the user is signed in
        if (session != null) {
          return HomeScreen();
        }

        // If signed out
        return AuthScreen();
      },
    );
  }
}
