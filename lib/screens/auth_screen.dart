import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duo/widgets/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(String email, String password, String username,
      File? image, bool isLogin, BuildContext ctx) async {
    UserCredential authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        final firebase_storage.FirebaseStorage storage =
            firebase_storage.FirebaseStorage.instance;
        await storage
            .ref('user_images/${authResult.user!.uid}.jpg')
            .putFile(image!);
        final url = await storage.ref('user_images/${authResult.user!.uid}.jpg').getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set({"username": username, "email": email, 'image_url' : url});
      }
    } on PlatformException catch (err) {
      var message = "An error occurred, please check your credential!";

      if (err.message != null) {
        message = err.message!;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ));

      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
      print(err);
    }
  }

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
                AuthForm(_submitAuthForm, _isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
