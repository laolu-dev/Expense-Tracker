import 'package:demo/routes.dart';
import 'package:flutter/material.dart';

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
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme:
              IconThemeData(color: Color.fromRGBO(44, 38, 70, 1), size: 32),
          actionsIconTheme:
              IconThemeData(color: Color.fromRGBO(44, 38, 70, 1), size: 32),
          titleTextStyle: TextStyle(
            color: Color.fromRGBO(44, 38, 70, 1),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: Screen.auth.name,
      debugShowCheckedModeBanner: false,
      routes: Screens().routes,
    );
  }
}
