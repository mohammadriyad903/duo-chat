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
            body: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chats/m9odWkXJoIjjq6BJv3CA/messgaes')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final documents = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(8),
                    child: Text(documents[index]["text"]),
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('chats/m9odWkXJoIjjq6BJv3CA/messgaes')
                    .add({
                      'text' : 'This data add by using float button.'
                    });
              },
              child: Icon(Icons.add),
            )));
  }
}
