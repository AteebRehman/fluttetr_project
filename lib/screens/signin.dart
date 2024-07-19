import 'package:flutter/material.dart';
import 'package:egroce/screens/home.dart';
import 'package:egroce/screens/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? email;
  String? password;
  String? emailError;
  String? passwordError;

  void validateFields() {
    setState(() {
      emailError = email?.isEmpty ?? true ? 'Email is required' : null;
      passwordError = password?.isEmpty ?? true ? 'Password is required' : null;
    });

    if (emailError == null && passwordError == null) {
      // Navigate to Home screen if all fields are filled
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  void navigateToSignUp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In', style: TextStyle(fontSize: 40)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) => email = value,
              decoration: InputDecoration(
                labelText: 'Email',
                errorText: emailError,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) => password = value,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: passwordError,
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  validateFields();
                },
                child: Text('Sign In', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: navigateToSignUp,
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

