import 'dart:async';

import 'package:flutter/material.dart';
import 'package:users_app/authentication/login_screen.dart';
import 'package:users_app/mainScreens/main_screen.dart';
import '../assistants/assistants_methods.dart';
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
    fAuth.currentUser != null? AssistantMethods.readCurrentOnlineUserInfo() : null;
    Timer(const Duration(seconds:3), () async
    {

      if(await fAuth.currentUser != null) 
      {
        currentFirebaseUser = fAuth.currentUser;
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (c)=> MainScreen()));
      }
      else {
      // ignore: use_build_context_synchronously
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
            Image.asset("images/logo.png"),

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
