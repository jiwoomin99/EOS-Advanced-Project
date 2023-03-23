import 'package:flutter/material.dart';
import '../config/palette.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  bool isSignupScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage('assets/background.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(top: 90, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Welcome to ',
                                style: TextStyle(
                                    letterSpacing: 1.0,
                                    color: Colors.white,
                                    fontSize: 25),
                                children: [
                              TextSpan(
                                  text: isSignupScreen == true ? 'EOS chat' : 'Back',
                                  style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                            ])),
                        SizedBox(height: 5.0),
                        Text(isSignupScreen == true? "Signup to continue" : "Signin to continue",
                            style: TextStyle(
                                letterSpacing: 1.0, color: Colors.white))
                      ],
                    ),
                  ),
                )),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: 150,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  height: isSignupScreen == true ? 280 : 250,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5)
                      ]),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState((){
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen == false
                                      ? Palette.activeColor
                                      : Palette.textColor1,
                                ),
                              ),
                              isSignupScreen == false
                                  ? Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.green,
                                    )
                                  : Container(margin: EdgeInsets.only(top: 3))
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState((){
                              isSignupScreen = true;
                            });
                          },
                            child: Column(
                          children: [
                            Text(
                              "SIGNUP",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSignupScreen == true
                                    ? Palette.activeColor
                                    : Palette.textColor1,
                              ),
                            ),
                            isSignupScreen == true
                                ? Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.green,
                                  )
                                : Container(margin: EdgeInsets.only(top: 3))
                          ],
                        ))
                      ],
                    ),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      margin: EdgeInsets.only(top: 20),
                        child: Form(
                      child: Column(
                          children: [
                        if(isSignupScreen == true) (TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),
                            iconColor: Palette.iconColor,
                            label: Text("User name"),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.textColor1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Palette.textColor1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                          ),
                        )),
                            if (isSignupScreen == true) SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                iconColor: Palette.iconColor,
                                label: Text("email"),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Palette.textColor1),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Palette.textColor1),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                iconColor: Palette.iconColor,
                                label: Text("password"),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Palette.textColor1),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    BorderSide(color: Palette.textColor1),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(35))),
                              ),
                            )
                      ]),
                    ))
                  ]),
                )),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignupScreen == true ? 400 : 360,
                right: 0,
                left: 0,
                child: Center(
                    child: Container(
                        height: 90,
                        width: 90,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.lightGreen, Colors.green],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 1))
                                ]),
                            child: Icon(Icons.arrow_forward, color: Colors.white,))
                    ))),
        Positioned(
          top: MediaQuery.of(context).size.height -125, right: 0, left: 0,
          child: Column(
              children: [
              isSignupScreen == true ? Text("or Signup with") : Text("or Signin with"),
              SizedBox(height: 10),
              TextButton.icon(
              onPressed: () {"google pressed";},
                style: TextButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size(155, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: Palette.googleColor,
          ),
                icon: Icon(Icons.add),
                label: Text("Google"))
          ],
        )
    )
          ],
        ));
  }
}
