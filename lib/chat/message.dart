import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chat_bubble.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('time', descending: true).snapshots(),
      builder: (context,AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final docs = snapshot.data!.docs;
        return ListView.builder(
            reverse: true,
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data();
              final text = data.containsKey('text') ? data['text'] : '';
              final userId = data.containsKey('userId') ? data['userId'] : '';
              final userName = data.containsKey('userName') ? data['userName'] : '';
              return ChatBubble(text,userId == user!.uid,userName);
              // TODO : text, userId가 내 아이디랑 같은지, username을 보내야함
            });
      },
    );
  }
}