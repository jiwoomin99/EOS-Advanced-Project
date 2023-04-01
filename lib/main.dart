import 'package:flutter/material.dart';
import 'package:eos_chatting/screens/main_screen.dart';
import 'package:eos_chatting/chatting/chat/chat_bubble.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
       MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EOS Chatting App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: LoginSignUpScreen(),)
         home: ChatScreen(),)
  );
}