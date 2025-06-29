import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  // Sign Up
  Future<void> signUp(
    context,
    String username,
    String email,
    String password,
  ) async {
    try {
      await Supabase.instance.client.auth.signOut();
      final response = await Supabase.instance.client.auth.signUp(
        email: email.trim(),
        password: password.trim(),
      );
      if (response.user != null && response.session != null) {
        await supabase.from('users').insert({
          'username': username,
          'email': email,
        });
      }
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Account created successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
      print(e);
    }
  }

  // Sign In
  Future<void> signIn(context, String email, String password) async {
    try {
      await Supabase.instance.client.auth.signInWithPassword(
        email: email.trim(),
        password: password.trim(),
      );

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Signed In Successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
      print(e);
    }
  }

  Future<void> logOut() async {
    await Supabase.instance.client.auth.signOut();
  }

  // Get Email
  String? getEmail() {
    return supabase.auth.currentUser?.email;
  }
}
