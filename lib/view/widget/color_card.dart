import 'package:flutter/material.dart';



class ColorCard extends StatelessWidget {
  const ColorCard({
    super.key, required this.colorkey,
  });
  final Color colorkey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color:colorkey )
    );
  }
}
