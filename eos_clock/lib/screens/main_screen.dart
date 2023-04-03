import 'package:flutter/material.dart';
import '../config/palette.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  late bool isSignupScreen;

  @override
  void initState() {
    super.initState();
    isSignupScreen = false;
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.backgroundColor,
        body: Stack(
          children: [
            Positioned(
                top:0, left: 0, right: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('background.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, top: 90),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Welcone ', style: TextStyle(
                              letterSpacing: 1.0, fontSize: 25, color: Colors.white
                          ),
                              children: [
                                TextSpan(text: isSignupScreen ? 'to EOS chat' : 'back', style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)
                                )
                              ]
                          ), textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                            isSignupScreen ? 'Signup to continue' : 'Signin to continue',
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 1.0)
                        )
                      ],),),)),
            Positioned(
                top: 150,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500,),
                  height: isSignupScreen ? 320.0 : 280.0,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 5
                        )
                      ]
                  ),
                  child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSignupScreen = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Login', style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? Palette.textColor1
                                            : Palette.activeColor
                                    ),
                                    ),
                                    if (!isSignupScreen) Container(
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: 55,
                                        color: Colors.green
                                    )
                                  ],)),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSignupScreen = true;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Signup', style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? Palette.activeColor
                                            : Palette.textColor1
                                    ),
                                    ),
                                    if (isSignupScreen) Container(
                                        margin: EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: 55,
                                        color: Colors.green
                                    )
                                  ],))
                          ],),
                        Container(
                            child: Form(
                              child: Column(
                                  children: [
                                    SizedBox(height: 10.0,),
                                    if (isSignupScreen == true)
                                      TextFormField(
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.person, color: Palette
                                              .iconColor),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Palette.textColor1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(35))
                                          ),),),
                                    if (isSignupScreen == true)
                                      SizedBox(height: 10.0,),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.mail, color: Palette
                                            .iconColor),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35))
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35))
                                        ),),),
                                    SizedBox(height: 10.0,),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock, color: Palette
                                            .iconColor),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35))
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Palette.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35))
                                        ),),)
                                  ]),))
                      ]),)),
            AnimatedPositioned(
                duration: Duration(milliseconds: 500,),
                top: isSignupScreen ? 430 : 390,
                right: 0,
                left: 0,
                child: Center(
                    child: Container(
                        padding: EdgeInsets.all(20), height: 90, width: 90,
                        decoration: BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.circular(50)),
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.lightGreen, Colors.green],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight
                                ),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius:1,
                                      blurRadius:1,
                                      offset: Offset(0,1)
                                  )
                                ]
                            ),
                            child: Icon(
                                Icons.arrow_forward, color: Colors.white)
                        )
                    )
                )
            ),
            Positioned(
                top: MediaQuery.of(context).size.height-125, right: 0, left:0,
                child: Column(
                    children: [
                      Text('or Login with'),
                      SizedBox(height: 10, ),
                      TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(155, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          backgroundColor: Palette.googleColor,),
                        icon: Icon(Icons.add, size: 18),
                        label: Text("Google"),

                      )

                    ]
                )
            )
          ],));
  }
}