import 'dart:async';

import 'package:driver_app/authentication/login_screen.dart';
import 'package:driver_app/authentication/signup_screen.dart';
import 'package:driver_app/mainScreen/main_screen.dart';

import 'package:flutter/material.dart';

import '../global/global.dart';




class MySplashScreen extends StatefulWidget
{
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MySplashScreenState createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen>
{

  startTimer()
  {
    Timer(const Duration(seconds:10), () async
    {

      if(await fAuth.currentUser != null) 
      {
    currentFirebaseUser = fAuth.currentUser;
      Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen())); 
      }
      else {
      Navigator.push(context, MaterialPageRoute(builder: (c)=> LoginScreen())); // changing it into next page 
      }
    });
  }
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container (
        color: Colors.white,
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo1.png"),

            const SizedBox(height: 10,),

            const Text ("",
              style: TextStyle (
                fontSize: 24,
                 color: Colors.white,
              ),

            )
          ],
        )
        )
      ),
    );
  }
}
