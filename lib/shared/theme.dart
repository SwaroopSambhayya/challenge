import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class ChallengeTheme {
  ThemeData base() {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xffFFEAE7),
        primaryColor: Colors.deepPurpleAccent[700],
        colorScheme: const ColorScheme.light(
            primary: Color.fromARGB(255, 110, 60, 247),
            onPrimary: Color.fromARGB(255, 110, 60, 247),
            secondary: Colors.black),
        cardTheme: const CardTheme(
            color: Color.fromARGB(255, 110, 60, 247), elevation: 0),
        textTheme: TextTheme(
            bodyMedium: GoogleFonts.francoisOne(color: Colors.white),
            bodySmall: GoogleFonts.montserrat(
              color: const Color.fromARGB(255, 110, 60, 247),
            ),
            titleSmall: GoogleFonts.francoisOne(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
            titleMedium: GoogleFonts.francoisOne(
                color: Colors.white, fontWeight: FontWeight.w400),
            titleLarge: GoogleFonts.francoisOne(
                color: Colors.white, fontWeight: FontWeight.w600),
            headlineSmall: GoogleFonts.francoisOne(color: Colors.white),
            headlineLarge: GoogleFonts.francoisOne(
                color: Colors.white, fontWeight: FontWeight.bold),
            headlineMedium: GoogleFonts.francoisOne(color: Colors.white)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xffFFEAE7),
          selectedIconTheme: IconThemeData(
            color: Color(0xffF69F85),
          ),
          unselectedIconTheme: IconThemeData(
            color: Color(0xffF69F85),
          ),
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.white)),
        iconTheme: const IconThemeData(color: Color(0xffF69F85)),
        chipTheme: ChipThemeData(
            side: const BorderSide(color: Colors.transparent),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: const Color(0xffFFEAE7),
            selectedColor: Colors.black));
  }
}
