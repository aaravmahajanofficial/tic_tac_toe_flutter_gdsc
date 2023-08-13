// ignore_for_file: use_full_hex_values_for_flutter_colors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final String path;
  final Color borderColor;
  final double width;
  final double height;

  const Button({
    super.key,
    required this.color,
    required this.text,
    required this.textColor,
    required this.path,
    required this.borderColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
          side: BorderSide(color: borderColor, width: 2),
        ),
        minimumSize: Size(width, height),
      ),
      onPressed: () {
        Navigator.pushNamed(context, path);
      },
      child: Text(
        text,
        style: GoogleFonts.raleway(
          fontSize: 20,
          color: textColor,
        ),
      ),
    );
  }
}
