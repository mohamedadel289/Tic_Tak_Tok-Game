import 'package:flutter/material.dart';
import 'package:tictaktok/xo_borad_Screen.dart';

class ItemSelection extends StatelessWidget {
  final String symbol;
  const ItemSelection({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
       Navigator.of(context).pushNamed(XoBoradScreen.routeName, arguments: symbol);
        },
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Image.asset(
            'assets/images/${symbol.toUpperCase()}.png',
            height: MediaQuery.sizeOf(context).height * 0.15,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
