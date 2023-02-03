import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("@UserName"),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.all(8),
            child: Text("It's Work!"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            FirebaseFirestore.instance
                .collection('chats/m9odWkXJoIjjq6BJv3CA/messages')  
                .snapshots()
                .listen((data) {
                  print(data.docs);
            }); 
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
