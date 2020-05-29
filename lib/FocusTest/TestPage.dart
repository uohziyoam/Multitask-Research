import 'package:MultitaskResearch/FocusTest/InstructionComponent.dart';
import 'package:MultitaskResearch/FocusTest/OrderedSquares.dart';
import 'package:MultitaskResearch/FocusTest/SquareAnimation.dart';
import 'package:MultitaskResearch/FocusTest/button.dart';
import 'package:MultitaskResearch/FocusTest/square.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<List<M>> before = [
  [M(45, SquareColor.BLUE), M(0, SquareColor.RED), M(90, SquareColor.BLUE)],
  [M(135, SquareColor.RED), M(45, SquareColor.WHITE), M(0, SquareColor.RED)],
  [M(45, SquareColor.BLUE), M(0, SquareColor.WHITE), M(135, SquareColor.RED)],
];

List<List<M>> after = [
  [M(0, SquareColor.BLUE), M(0, SquareColor.RED), M(0, SquareColor.BLUE)],
  [M(0, SquareColor.RED), M(0, SquareColor.BLUE), M(0, SquareColor.RED)],
  [M(0, SquareColor.BLUE), M(0, SquareColor.WHITE), M(0, SquareColor.RED)],
];

List<List<List<M>>> beforeData = [before, before, before];
List<List<List<M>>> afterData = [after, after, after];

class TestPage extends StatefulWidget {
  final String title;
  TestPage({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  double widthRatio, heightRatio;
  int currentLevel = 1;

  void nextLevel(cur) {
    setState(() {
      currentLevel = cur;
    });
  }

  @override
  Widget build(BuildContext context) {
    widthRatio = MediaQuery.of(context).size.width / 768;
    heightRatio = MediaQuery.of(context).size.height / 1024;
    return Scaffold(
        body:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        alignment: AlignmentDirectional.center,
        width: 700,
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 204, 204, 204)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 5),
                width: 658,
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 204, 204, 204)),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 20,
                      color: Color.fromARGB(255, 240, 244, 244),
                      child: Text(
                        widget.title + " $currentLevel of ${beforeData.length}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 18, 18, 18),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    LinearProgressIndicator(
                      value: currentLevel / beforeData.length,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 105),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SquareAnimation(
                                currentLevel: currentLevel,
                                totalLevel: beforeData.length,
                                nextLevel: nextLevel,
                                before: beforeData[currentLevel - 1],
                                after: afterData[currentLevel - 1],
                              )
                            ])),
                    Padding(
                      padding: EdgeInsets.only(top: 200),
                    )
                  ],
                )),
          ],
        ),
      )
    ]));
  }
}

// widget.pageType == PageType.TestPage
//                         ? InstructionContent(
//                             levelsLeft: 9,
//                             buttonClick: (res) {
//                               print(res);
//                             },
//                           )
//                         : Container,
