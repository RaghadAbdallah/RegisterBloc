import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/firstpage.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RegisterPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/image/ITGlogo.png'),
                radius: 150,
              )),
          SizedBox(
            height: 60,
          ),
          Text(
            'Done By Raghad',
            style: TextStyle(
              inherit: false,
              color: Colors.white24,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}




