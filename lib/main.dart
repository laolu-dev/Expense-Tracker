import 'package:demo/constants.dart';
import 'package:demo/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      theme: ThemeData(
        textTheme: GoogleFonts.dmSansTextTheme(),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.neutral, size: 32),
          actionsIconTheme: IconThemeData(color: AppColors.neutral, size: 32),
          titleTextStyle: GoogleFonts.dmSans(
              color: AppColors.neutral,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
      ),
      initialRoute: Screen.auth.name,
      debugShowCheckedModeBanner: false,
      routes: Screens().routes,
    );
  }
}
