import 'package:flutter/material.dart';
import '../config/palette.dart';
class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);
  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  var isSignupScreen = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top:0, left:0, right:0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('background.png'),
                  fit: BoxFit.fill
                ),
              ),
            child: Container(
                padding: EdgeInsets.only(left:20, top:90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                RichText(
                text: TextSpan(
                text: 'Welcone ', style: TextStyle(
                    letterSpacing:1.0, fontSize:25, color: Colors.white
                ),
                    children: [
                      TextSpan(text: 'to EOS chat', style: TextStyle(
                          letterSpacing: 1.0, fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)
                      )
                    ]
                ), textAlign: TextAlign.left,
            ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Signup to continue',
                style: TextStyle(color: Colors.white, letterSpacing: 1.0)
            )],),),)),
          Positioned(
            top:150,
            child: Container(height: 280.0, padding: EdgeInsets.all(20), width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), blurRadius: 15, spreadRadius: 5
                  )
                ]
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Column(
                          children: [
                            Text(
                              'Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                            color: isSignupScreen ? Palette.textColor1 : Palette.activeColor
                            ),
                        ),
                        if (!isSignupScreen) Container(
                          margin: EdgeInsets.only(top: 3), height: 2, width: 55, color: Colors.green
                        )],)),
                      GestureDetector(
                          child: Column(
                            children: [
                              Text(
                                'Signup', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                                  color: isSignupScreen ? Palette.textColor1 : Palette.activeColor
                              ),
                              ),
                              if (isSignupScreen) Container(
                                  margin: EdgeInsets.only(top: 3), height: 2, width: 55, color: Colors.green
                              )],))],),
              Container(
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.abc ,color: Palette.iconColor),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                            borderRadius: BorderRadius.all(Radius.circular(35))
                          ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Palette.textColor1),
                                borderRadius: BorderRadius.all(Radius.circular(35))
                            ),),)]),))]),))],));}
}