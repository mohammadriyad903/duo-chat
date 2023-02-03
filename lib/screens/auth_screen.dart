import 'package:duo/widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: const TextSpan(
                        text: "D",
                        style: TextStyle(
                          color: Color(0xFFFE3B84),
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                      TextSpan(
                        text: " U",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " O",
                        style: TextStyle(
                          color: Color(0xFFFE3B84),
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                AuthForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
