import 'package:flutter/material.dart';

class BoardItem extends StatelessWidget {
  String value;
   void Function(int) onTap;
   int index;
  BoardItem({
    super.key,
    required this.value,
    required this.onTap,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final imageName = value.toUpperCase();

    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: value.isEmpty ? null : Image.asset('assets/images/$imageName.png'),
      ),
    );
  }
}
