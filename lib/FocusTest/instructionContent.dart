import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InstructionContent extends StatefulWidget {
  final int levelsLeft;
  final bool isPracticeEnd;
  final bool isTestEnd;
  final Function buttonClick;

  InstructionContent({
    Key key,
    @required this.levelsLeft,
    @required this.buttonClick,
    @required this.isPracticeEnd,
    @required this.isTestEnd,
  }) : super(key: key);

  @override
  _InstructionContentState createState() => _InstructionContentState();
}

class _InstructionContentState extends State<InstructionContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Did any of the red targets rotate?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 18, 18, 18),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              ButtonTheme(
                  height: 30,
                  minWidth: 25,
                  child: RaisedButton(
                      elevation: 0,
                      focusElevation: 0,
                      hoverElevation: 0,
                      disabledElevation: 0,
                      highlightElevation: 0,
                      color: Color.fromARGB(255, 0, 66, 118),
                      hoverColor: Color.fromRGBO(0, 90, 168, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(2.0),
                      ),
                      onPressed: () {
                        widget.buttonClick(true);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('YES',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        ],
                      ))),
              Padding(padding: EdgeInsets.only(left: 5, right: 5)),
              ButtonTheme(
                  height: 30,
                  minWidth: 25,
                  child: RaisedButton(
                      elevation: 0,
                      focusElevation: 0,
                      hoverElevation: 0,
                      disabledElevation: 0,
                      highlightElevation: 0,
                      color: Color.fromARGB(255, 0, 66, 118),
                      hoverColor: Color.fromRGBO(0, 90, 168, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(2.0),
                      ),
                      onPressed: () {
                        widget.buttonClick(false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('NO',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        ],
                      )))
            ],
          ),
          widget.isPracticeEnd
              ? Row(
                  children: <Widget>[
                    Text(
                      "The following tests are scored.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 168, 168, 168),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              : Container(),
          widget.isTestEnd
              ? Row(
                  children: <Widget>[
                    Text(
                      "Test is finised.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 168, 168, 168),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              : Container(),
          !widget.isPracticeEnd && !widget.isTestEnd
              ? Row(
                  children: <Widget>[
                    // Text(
                    //   widget.levelsLeft == 1
                    //       ? "You have 1 more test to complete."
                    //       : "You have ${widget.levelsLeft} more tests to complete.",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       fontSize: 15,
                    //       color: Color.fromARGB(255, 168, 168, 168),
                    //       fontWeight: FontWeight.normal),
                    // ),
                  ],
                )
              : Container(),
          !widget.isPracticeEnd && !widget.isTestEnd
              ? Row(
                  children: <Widget>[
                    Text(
                      "The next test starts immediately",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 168, 168, 168),
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              : Container(),
        ]);
  }
}
