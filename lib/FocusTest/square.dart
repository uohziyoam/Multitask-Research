import 'dart:math';

import 'package:MultitaskResearch/FocusTest/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum SquareColor { RED, BLUE, WHITE }

class Squares {
  M before;
  M after;
  bool isRedRotated;

  Squares({this.before, this.after, this.isRedRotated});
}

class M {
  Color squareColor;
  Color borderColor;
  int degree;
  bool invisible;

  M(
    this.degree,
    squareColor,
  ) {
    if (squareColor == SquareColor.BLUE) {
      this.squareColor = BLUE_COLOR_BACKGROUND;
      this.borderColor = BLUE_COLOR_BORDER;
    }
    if (squareColor == SquareColor.RED) {
      this.squareColor = RED_COLOR_BACKGROUND;
      this.borderColor = RED_COLOR_BORDER;
    }
    if (squareColor == SquareColor.WHITE) {
      this.squareColor = WHITE_COLOR_BACKGROUND;
      this.borderColor = WHITE_COLOR_BORDER;
    }
  }
}



class Square extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final double degree;
  final double leftPadding;
  final double rightPadding;

  const Square({
    Key key,
    this.backgroundColor,
    this.borderColor,
    this.degree,
    this.leftPadding,
    this.rightPadding,
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

  Widget gridGenerator({@required List<List<M>> data}) {
    List<Widget> row = [];

    for (var i = 0; i < 3; i++) {
      List<Widget> subRow = [];
      for (var j = 0; j < 3; j++) {
        subRow.add(
          Square(
              leftPadding: 5,
              rightPadding: 5,
              borderColor: data[i][j].borderColor,
              backgroundColor: data[i][j].squareColor,
              degree: data[i][j].degree * 1.0),
        );
      }
      row.add(Padding(
          padding: EdgeInsets.only(top: 130),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center, children: subRow)));
    }

    return Column(
      children: row,
    );
  }
}
