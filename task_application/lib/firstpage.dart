import 'package:flutter/material.dart';
import 'package:task_application/secondscreen.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(''),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Image.asset(
            'assets/undraw.png',
            width: 500,
            height: 350,
            fit: BoxFit.contain,
          ),

          const Column(
            children: [
              Center(
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'Welcome to',
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 35,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Tasky',
                          style: TextStyle(
                              color: Color(0xFF6C63FF),
                              fontWeight: FontWeight.w900,
                              fontSize: 35)),
                      TextSpan(
                        text: '!',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const Text(
            textAlign: TextAlign.center,
            'Manage all your projects and tasks in one place.',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),

          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 20, right: 20, left: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(const Color(0xFF6C63FF)),
                // padding: WidgetStateProperty.all(const EdgeInsets.only(left: 10, right: 10)),
                textStyle:
                    WidgetStateProperty.all(const TextStyle(fontSize: 20)),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Secondscreen(),
                  ),
                ),
              },
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          // Container(),

          const Center(
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  TextSpan(
                    text: ' Sign in',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
