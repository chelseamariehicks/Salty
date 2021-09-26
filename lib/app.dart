import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'screens/main_menu.dart';

class App extends StatefulWidget {
  @override 
  AppState createState() => AppState();
}

class AppState extends State<App> {

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salty',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: MainMenu(),
    );
  }
}