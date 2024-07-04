import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/firstpage.dart';
import 'screens/inicio.dart';
import 'screens/secondscreen.dart';

void main() {
  const String fullName = 'Your Full Name';
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Firstpage(),
        '/secondpage': (context) => const Secondscreen(),
        '/thirdpage': (context) => const Inicio(
              fullName: fullName,
            ),
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
    return GetMaterialApp(
      title: 'Task Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Firstpage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
