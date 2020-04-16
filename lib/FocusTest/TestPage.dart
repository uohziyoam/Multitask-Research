import 'package:MultitaskResearch/FocusTest/constants.dart';
import 'package:MultitaskResearch/FocusTest/square.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestPage extends StatefulWidget {
  final String title;
  final int totalLevel;
  final Widget content;

  TestPage({
    Key key,
    @required this.title,
    @required this.totalLevel,
    @required this.content,
  }) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  double widthRatio, heightRatio;
  int currentLevel = 1;

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
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: 100),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[widget.content]))
          ],
        ),
      )
    ]));
  }
}
