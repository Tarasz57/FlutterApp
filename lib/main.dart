import 'package:flutter/material.dart';
import 'package:university_advisor/screens/login_screen.dart';

void main(){
    //debugPaintSizeEnabled = true;
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}