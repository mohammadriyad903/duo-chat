import 'package:duo/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "BBYrAsvTo2-QwWyoOL1s34MSRg_4xYcDZ0bsPuiWiIvP-gGjVKrpuNr6B8icP99q11akQw7zueNpz2ysifYktxE", 
      appId: '1:14474749038:android:7534d91ba646b00d03f27f', 
      projectId: 'duo-chat-d95d2', 
      messagingSenderId: '14474749038', 
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        theme: ThemeData(),
        home: ChatScreen());
  }
}
