import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eos_chatting/config/palette.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final TextEditingController _controller = TextEditingController();
  String _userEnterMessage = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('user').doc(user!.uid).get();
    // TODO : FirebaseFirestore의 user collection의 user.uid를 가져오기 (마지막에 get 사용)
    FirebaseFirestore.instance.collection('chat').add({
      'text': _userEnterMessage,
      'time': Timestamp.now(),
      'userId': user!.uid,
      'userName': userData.data()!['userName']
    });
    _controller.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 8),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: null,
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message ...'),
                onChanged: (value) {
                  _userEnterMessage = value;
                  // setState(() {
                  //   _userEnterMessage = value;
                  // });
                },
              ),
            ),
            IconButton(
                onPressed: () {
                  final trimmedMessage = _userEnterMessage.trim();
                  if (trimmedMessage.isNotEmpty) {
                    _sendMessage();
                  }
                },
                icon: Icon(Icons.send),
                color: Palette.eosColor)
          ],
        ));
  }
}
