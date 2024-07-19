import 'package:flutter/material.dart';
import 'package:egroce/screens/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? name;
  String? email;
  String? password;
  String? confirmPassword;
  String? nameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  void validateFields() {
    setState(() {
      nameError = name?.isEmpty ?? true ? 'Name is required' : null;
      emailError = email?.isEmpty ?? true ? 'Email is required' : null;
      passwordError = password?.isEmpty ?? true ? 'Password is required' : null;
      confirmPasswordError = confirmPassword?.isEmpty ?? true ? 'Confirm Password is required' : null;

      if (password != null && confirmPassword != null && password != confirmPassword) {
        confirmPasswordError = 'Passwords do not match';
      }
    });

    if (nameError == null && emailError == null && passwordError == null && confirmPasswordError == null) {
      // Navigate to Home screen if all fields are filled
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(fontSize: 40)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) => name = value,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: nameError,
              ),
            ),
            SizedBox(height: 20.0),
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
            TextField(
              onChanged: (value) => confirmPassword = value,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                errorText: confirmPasswordError,
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  validateFields();
                },
                child: Text('Sign Up', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
