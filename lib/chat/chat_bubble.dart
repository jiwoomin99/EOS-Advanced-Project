import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.message, this.isMe, this.userName, {super.key});
  final message, isMe, userName;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
        Padding(
        padding: isMe ? EdgeInsets.all(5) : EdgeInsets.zero,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        if(!isMe)
          Padding(
    padding: EdgeInsets.only(left: 10),
    child: Text(
    userName,
    style: TextStyle(color: Colors.grey),
    ),
    ),


        Container(
        decoration: BoxDecoration(
        color: isMe ? Colors.lightGreen : Colors.black12, //TODO 6: 나일때는 lightGreen, 아닐때는 black12
    borderRadius: isMe
    ? BorderRadius.only(
    topLeft: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    )
        : BorderRadius.only(
    topRight: Radius.circular(10),
    topLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
    )),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
// TODO 8: padding은 위아래 10, 좌우 16, margin은 위아래 4, 좌우 8
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    child: Text(
    message,
    style:  TextStyle(
    color: isMe ? Colors.white : Colors.black,
    ),
    )),

        ],
    ),
    ),
    ],
    );
  }
}