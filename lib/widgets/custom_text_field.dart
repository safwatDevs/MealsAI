import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
    this.hint,
    this.controller,
    this.isPassword, {
    super.key,
  });
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromRGBO(245, 240, 229, 1),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hint: Text(
            hint,
            style: GoogleFonts.splineSans(
              color: Color.fromRGBO(158, 135, 71, 1),
              fontSize: 17,
            ),
          ),
          filled: false,
          fillColor: Color.fromRGBO(245, 240, 229, 1),
          border: InputBorder.none,
        ),

        style: GoogleFonts.splineSans(
          backgroundColor: Color.fromRGBO(245, 240, 229, 1),
        ),
      ),
    );
  }
}
