import 'package:MultitaskResearch/FocusTest/InstructionComponent.dart';
import 'package:MultitaskResearch/FocusTest/OrderedSquares.dart';
import 'package:MultitaskResearch/FocusTest/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum PageType { TestPage, InstructionPage }

class InstructionPage extends StatefulWidget {
  final String title;
  final int totalLevel;
  final Widget content;

  InstructionPage({
    Key key,
    @required this.title,
    @required this.totalLevel,
    @required this.content,
  }) : super(key: key);

  @override
  _InstructionPageState createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  double widthRatio, heightRatio;
  int currentLevel = 1;

  var levels = [
    InstructionComponent(
      upperContent: OrderedSquares(),
      instruction:
          "Your task in this test is to concentrate on the red rectangles while ignoring the blue rectangles.",
    ),
    InstructionComponent(
      upperContent: OrderedSquares(),
      instruction:
          "First you'll see a quick flash of some red and blue rectangles. Then you'll see a second scene in which one of the red rectangles may have rotated. Your job will be to note any such change.",
    ),
    InstructionComponent(
        upperContent: OrderedSquares(),
        instruction:
            "You'll dod 4 unscored practice tests, then 24 scored tests. The quiz will cover your whole screen to minimize distractions. Hit the \"ESC\" key to return to a normal view.")
  ];

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
                        widget.title + " $currentLevel of ${widget.totalLevel}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromARGB(255, 18, 18, 18),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    LinearProgressIndicator(
                      value: currentLevel / widget.totalLevel,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[levels[currentLevel - 1]])),
                    Button(
                      currentLevel: currentLevel,
                      changeLevel: (cur) {
                        setState(() {
                          currentLevel = cur;
                        });
                      },
                    ),
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
