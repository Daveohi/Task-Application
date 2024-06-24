import 'package:flutter/material.dart';
import 'package:task_application/firstpage.dart';
import 'package:task_application/inicio.dart';
import 'package:task_application/secondscreen.dart';
// import 'package:task_application/thirdpage.dart';

void main() {
  const String fullName = 'Your Full Name';
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Firstpage(),
        '/secondpage': (context) => const Secondscreen(),
        '/thirdpage': (context) => const Inicio(
fullName: fullName,
            ),
        // '/inicio': (context) => const Inicio(),
      },
      debugShowCheckedModeBanner: false,
    ),
  );
  const MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Demo',
      theme: ThemeData(fontFamily: 'Product Sans'),
      home: const Firstpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
