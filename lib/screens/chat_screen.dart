import 'package:eos_chatting/chat/new_message.dart';
import 'package:eos_chatting/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../chat/message.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var _authentication = FirebaseAuth.instance;
    return Scaffold(
        appBar: AppBar(
          title: Text('Chat screen'),
          actions: [
            IconButton(
                onPressed: () {
                  _authentication.signOut();
                },
                icon: Icon(Icons.exit_to_app_rounded, color:
                Colors.white))
          ],
          backgroundColor: Palette.eosColor,
        ),
        body: Container(
// TODO : 아래 틀에 맞게 message와 new message를 알맞게
        //배치해 보세요! Message는 Expanded로 감싸주세요!
        child: Column(children: [
        Expanded(child: Messages()), NewMessage(),
        ],
        )));
  }
}
