import 'package:dreambig_mobile/screens/school_list.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SchoolList(),));
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dreambig_logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            const CircularProgressIndicator(
                color:Color(0xFF1c3c6e)),
          ],
        ),
      ),
    );
  }
}