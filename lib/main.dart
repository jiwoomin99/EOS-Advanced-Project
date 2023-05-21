import 'package:flutter/material.dart';
import 'package:eos_chatting/screens/main_screen.dart';
import 'package:eos_chatting/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:eos_chatting/config/color_service.dart';
import 'package:eos_chatting/config/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
// flutter core 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const
  MaterialApp(debugShowCheckedModeBanner:
  false, home: MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chatting App',
        theme: ThemeData(
        primarySwatch: ColorService.createMaterialColor(Palette.eosColor),
    ),
    home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ChatScreen();
        }
        return LoginSignUpScreen();
        },
      ),
    ); // home: ChatScreen());
  }
}