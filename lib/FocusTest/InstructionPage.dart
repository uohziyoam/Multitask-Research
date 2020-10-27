import 'package:MultitaskResearch/FocusTest/InstructionComponent.dart';
import 'package:MultitaskResearch/FocusTest/OrderedSquares.dart';
import 'package:MultitaskResearch/FocusTest/TestPage.dart';
import 'package:MultitaskResearch/FocusTest/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InstructionPage extends StatefulWidget {
  final String title;
  final int totalLevel;
  final Widget content;
  final String id;

  InstructionPage({
    Key key,
    @required this.title,
    @required this.totalLevel,
    @required this.content,
    @required this.id,
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
      upperContent: Container(
        // height: 150,
        width: 655,
        child: Image.asset(
          "assets/second.png",
          fit: BoxFit.cover,
        ),
      ),
      instruction:
          "First you'll see a quick flash of some red and blue rectangles. Then you'll see a second scene in which one of the red rectangles may have rotated. Your job will be to note any such change.",
    ),
    InstructionComponent(
        upperContent: Container(),
        instruction:
            "You'll do 4 unscored practice tests, then 80 scored tests.")
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
                      padding: EdgeInsets.only(top: 25),
                    ),
                    Opacity(
                      opacity: currentLevel != 3 ? 0 : 1,
                      child: Container(
                          width: 165,
                          child: ButtonTheme(
                              minWidth: widthRatio * 100,
                              height: 35,
                              disabledColor: Color.fromARGB(255, 255, 0, 1),
                              child: RaisedButton(
                                  elevation: 0,
                                  focusElevation: 0,
                                  hoverElevation: 0,
                                  disabledElevation: 0,
                                  highlightElevation: 0,
                                  color: Color.fromARGB(255, 0, 66, 118),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(2.0),
                                  ),
                                  onPressed: () {
                                    if (currentLevel != 3) {
                                      return;
                                    }
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TestPage(
                                            title: "Practice Test",
                                            id: widget.id,
                                          ),
                                        ));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Start the Test',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                    ],
                                  )))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 200),
                    ),
                  ],
                )),
          ],
        ),
      )
    ]));
  }
}
