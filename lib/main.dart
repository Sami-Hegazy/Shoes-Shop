import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nike',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 30,
            color: Colors.black87,
          ),
          headline2: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.grey,
          ),
          headline4: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w300,
            fontSize: 15,
          ),
          caption: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.grey,
            fontSize: 13,
          ),
          button: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
      ),
      home: const MyHomeScreen(),
    );
  }
}
