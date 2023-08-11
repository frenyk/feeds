import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Headertext = GoogleFonts.abel(fontSize: 50, fontWeight: FontWeight.bold);
final HeaderSubtext =
    GoogleFonts.actor(fontSize: 15, fontWeight: FontWeight.w100);

class TTextTheme {
  // ignore: non_constant_identifier_names
  static TextTheme LightTextTheme = TextTheme(
    headline3: GoogleFonts.poppins(
      color: Color.fromARGB(221, 0, 0, 0),
      fontWeight: FontWeight.bold,
    ),
    subtitle2: GoogleFonts.poppins(
      color: Color.fromARGB(137, 0, 0, 0),
      fontSize: 24,
    ),
  );
  // ignore: non_constant_identifier_names
  static TextTheme DarkTextTheme = TextTheme(
      headline2: GoogleFonts.poppins(
        color: Colors.white70,
      ),
      subtitle2: GoogleFonts.poppins(
        color: Colors.white60,
        fontSize: 24,
      ));
}
