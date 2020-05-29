import 'dart:async';

import 'package:MultitaskResearch/FocusTest/instructionContent.dart';
import 'package:MultitaskResearch/FocusTest/square.dart';
import 'package:flutter/widgets.dart';

class SquareAnimation extends StatefulWidget {
  int currentLevel;
  final int totalLevel;
  final Function nextLevel;
  final List<List<M>> before;
  final List<List<M>> after;

  SquareAnimation({
    Key key,
    @required this.currentLevel,
    @required this.totalLevel,
    @required this.nextLevel,
    @required this.before,
    @required this.after,
  }) : super(key: key);

  @override
  _SquareAnimationState createState() => _SquareAnimationState();
}

class _SquareAnimationState extends State<SquareAnimation> {
  Timer timer1, timer2, timer3, timer4, timer5;
  bool isBefore = false, isAfter = false, isDone = false;

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  void dispose() {
    timer1?.cancel();
    timer2?.cancel();
    timer3?.cancel();
    timer4?.cancel();
    timer5?.cancel();
    super.dispose();
  }

  void start() {
    setState(() {
      isBefore = false;
      isAfter = false;
      isDone = false;
    });
    timer1 = new Timer(Duration(milliseconds: 300), () {
      setState(() {
        isBefore = false;
        isAfter = false;
      });
      timer2 = new Timer(const Duration(milliseconds: 300), () {
        setState(() {
          isBefore = true;
          isAfter = false;
        });
        timer3 = new Timer(Duration(milliseconds: 300), () {
          setState(() {
            isBefore = false;
            isAfter = false;
          });
          timer4 = new Timer(Duration(milliseconds: 300), () {
            setState(() {
              isBefore = false;
              isAfter = true;
            });
            timer5 = new Timer(Duration(milliseconds: 300), () {
              setState(() {
                isBefore = false;
                isAfter = false;
                isDone = true;
              });
            });
          });
        });
      });
    });
  }

  Widget create() {
    if (isBefore && !isAfter) {
      return Square().gridGenerator(data: widget.before);
    }

    if (!isBefore && isAfter) {
      return Square().gridGenerator(data: widget.after);
    }

    if (isDone) {
      return InstructionContent(
          levelsLeft: widget.totalLevel - widget.currentLevel,
          buttonClick: (isYes) {
            start();
            widget.currentLevel++;
            widget.nextLevel(widget.currentLevel);
          });
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center, child: create(), height: 500);
  }
}
