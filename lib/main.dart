import 'package:flutter/material.dart';
import 'package:meals_ai/screens/auth_screen.dart';
import 'package:meals_ai/screens/main_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpnZWF0Z2dtd2l5Z2R6bmFnY3lkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTExMzI3MDIsImV4cCI6MjA2NjcwODcwMn0.c0aKRtv9s6mm1JSDuzZSytepVs9ys9e1UK0UF1NTj1Q',
    url: 'https://jgeatggmwiygdznagcyd.supabase.co',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen());
  }
}
