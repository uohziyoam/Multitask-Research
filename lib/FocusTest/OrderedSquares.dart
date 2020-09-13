import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrderedSquares extends StatelessWidget {
  const OrderedSquares({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 655,
      child: Image.asset(
        "assets/orderedSquares.png",
        fit: BoxFit.cover,
      ),
    );
  }
}
