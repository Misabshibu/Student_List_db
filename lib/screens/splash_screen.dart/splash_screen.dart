import 'package:flutter/material.dart';
import 'package:students_list/screens/home%20screen/screen_home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    loadHome(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        height: double.infinity,
        width: double.infinity,
        child: const Center(
          child: Text(
            'Student List',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }

  Future loadHome(context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => ScreenHome())));
  }
}
