// ignore_for_file: prefer_const_constructors

// import 'package:dave_stores/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:task_application/Project%20Page/pages/home_page.dart';
// import 'package:flutter/widgets.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Column(
          children: [
            
            Image.asset(
              'assets/images/dev-shops_logo.png',
              width: 150,
              height: 260,
            ),
            SizedBox(
              height: 58,
            ),
            Text(
              'Delighted to have you on board',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Shopping Made Easy',
              style: TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 48,
              
            ),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
              child: Center(
                child: Container(
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "Let's Go Shopping",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16,  ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
