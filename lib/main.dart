import 'package:flutter/material.dart';
import 'package:tictaktok/welcom_screen.dart';
import 'package:tictaktok/xo_borad_Screen.dart';

void main(){
  runApp(const XOGame());
}
class XOGame extends StatelessWidget {
  const XOGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {XoBoradScreen.routeName: (_) => XoBoradScreen(),
      WelcomScreen.routeName:(context) => WelcomScreen()},
      initialRoute: WelcomScreen.routeName,
    );
  }
}