import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Square extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double degree;
  final double leftPadding;
  final double rightPadding;

  const Square({
    Key key,
    @required this.backgroundColor,
    @required this.borderColor,
    @required this.degree,
    @required this.leftPadding,
    @required this.rightPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
      child: Transform.rotate(
          angle: pi / (180 / degree),
          child: Container(
              width: 160,
              height: 20,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(width: 1.45, color: borderColor),
              ))),
    );
  }
}
