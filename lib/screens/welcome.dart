import 'package:egroce/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:egroce/screens/signin.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/app_logo.jpg"),
          fit: BoxFit.fill,
        )),
      ),
    );
  }
}
