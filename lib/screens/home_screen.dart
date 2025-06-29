import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_ai/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = AuthService();
  final brown = Color.fromARGB(255, 89, 36, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: Text('Are you sure you want to sign out'),
                    actions: [
                      CupertinoDialogAction(
                        /// This parameter indicates this action is the default,
                        /// and turns the action's text to bold text.
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'No',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                      CupertinoDialogAction(
                        /// This parameter indicates the action would perform
                        /// a destructive action such as deletion, and turns
                        /// the action's text color to red.
                        isDestructiveAction: true,
                        onPressed: () {
                          auth.logOut();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Successfully logged out')),
                          );
                          Navigator.pop(context);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: FaIcon(FontAwesomeIcons.rightFromBracket, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
