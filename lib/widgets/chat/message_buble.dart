import 'package:flutter/material.dart';

class MessageBuble extends StatelessWidget {
  final String message;
  final bool isMe;
  final Key key;
  MessageBuble(
    this.message,
    this.isMe,
  {required this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMe ? Colors.white : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          width: 140,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 4,
          ),
          child: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
