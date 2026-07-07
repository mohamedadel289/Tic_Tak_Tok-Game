import 'package:flutter/material.dart';
import 'package:tictaktok/item_selection.dart';

class WelcomScreen extends StatelessWidget {
  static const String routeName = '/welcom_screen';
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          top: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.7,
                alignment: Alignment.center,
              width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/tic.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text(
                  'Tic Tac Toe ',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Pick who goes first?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(children: [
                  ItemSelection(symbol: 'x'),
                  SizedBox(width: 16),
                  ItemSelection(symbol: 'o'),
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
