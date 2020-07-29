import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Image.asset(
            'assets/logo.png',
            width: 250,
            height: 300,
          ),
        ));
  }
}
