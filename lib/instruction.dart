import 'dart:async';
import 'dart:convert';
import 'package:MultitaskResearch/instrucption-description.dart';
import 'package:MultitaskResearch/test.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Instruction extends StatefulWidget {
  final bool isInstruction;
  Instruction({Key key, @required this.isInstruction}) : super(key: key);

  @override
  _InstructionState createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  Timer timer1, timer2;
  Stopwatch stopwatch;
  FocusNode focusNode = FocusNode();
  double widthRatio, heightRatio;
  bool isCue = false,
      isStimulus = false,
      isLeftButtonClicked = false,
      isRightButtonClicked = false;
  int currentLevel = 1, instructionStep = 2;

  List<CueStimulus> numberLetter;

  Color iconColorRight = Color.fromARGB(255, 112, 112, 112);
  Color iconColorLeft = Color.fromARGB(255, 112, 112, 112);

  @override
  void initState() {
    super.initState();
    buttonClicked();
    loadGameData(widget.isInstruction).then((s) => setState(() {
          numberLetter = s.list;
        }));
  }

  @override
  void dispose() {
    timer1.cancel();
    timer2.cancel();
    stopwatch.stop();
    super.dispose();
  }

  void stopWatchPrint() {
    if (stopwatch != null && stopwatch.isRunning) {
      print("${stopwatch.elapsedMilliseconds}");
    }
  }

  void wrapResult() {}

  void buttonClicked() {
    if (currentLevel >= 4) {
      currentLevel = 1;
    }
    stopwatch = new Stopwatch();
    setState(() {
      currentLevel += 1;
    });

    timer1 = new Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        isCue = true;
        isStimulus = false;
      });

      timer2 = new Timer(const Duration(milliseconds: 1000), () {
        setState(() {
          isCue = false;
          isStimulus = true;
          stopwatch.start();
          buttonClicked();
        });
      });
    });
  }

  Widget cueAndStimulus() {
    if (instructionStep == 2) {
      return Container(
          width: 350,
          alignment: Alignment(0.0, 0.0),
          height: 150,
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "a6",
            style: TextStyle(fontSize: 120),
          ));
    }

    if (isCue) {
      return Container(
          width: 350,
          alignment: Alignment(0.0, 0.0),
          height: 150,
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "${numberLetter[currentLevel - 1].type}",
            style: TextStyle(fontSize: 80, color: Colors.grey),
          ));
    }

    if (isStimulus) {
      return Container(
          width: 350,
          alignment: Alignment(0.0, 0.0),
          height: 150,
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "${numberLetter[currentLevel - 1].stimulus}",
            style: TextStyle(fontSize: 120),
          ));
    }

    return Container(
        width: 350,
        alignment: Alignment(0.0, 0.0),
        height: 150,
        margin: EdgeInsets.only(top: 10),
        child: Text(
          "a3",
          style: TextStyle(fontSize: 120),
        ));
  }

  void setStep(step) {
    setState(() {
      instructionStep = step;
      if (instructionStep == 1) {
        buttonClicked();
      } else if (instructionStep == 2) {
        isCue = false;
        isStimulus = true;
        timer1?.cancel();
        timer2?.cancel();
        stopwatch?.stop();
      } else if (instructionStep == 3) {
        isCue = false;
        isStimulus = true;
        timer1?.cancel();
        timer2?.cancel();
        stopwatch?.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widthRatio = MediaQuery.of(context).size.width / 768;
    heightRatio = MediaQuery.of(context).size.height / 1024;
    FocusScope.of(context).requestFocus(focusNode);
    return Scaffold(
        body: RawKeyboardListener(
            focusNode: focusNode,
            onKey: (value) {
              bool isKeyUp =
                  value.toDiagnosticsNode().toString().split("#").first ==
                      "RawKeyUpEvent";

              setState(() {
                if (value.data.keyLabel == "ArrowLeft") {
                  isLeftButtonClicked = !isKeyUp;
                }

                if (value.data.keyLabel == "ArrowRight") {
                  isRightButtonClicked = !isKeyUp;
                }
              });
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
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
                          border: Border.all(
                              color: Color.fromARGB(255, 204, 204, 204)),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 20,
                              color: Color.fromARGB(255, 240, 244, 244),
                              child: Text(
                                "Instructions $instructionStep of 3",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 18, 18, 18),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            LinearProgressIndicator(
                              value: instructionStep / 3,
                            ),
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: heightRatio * 250),
                      child: instructionStep == 3
                          ? Container(
                              width: 165,
                              padding: EdgeInsets.only(bottom: 112),
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
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Test(isUnscored: true)));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Start the Test',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white)),
                                        ],
                                      ))))
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                instructionStep == 1
                                    ? Container()
                                    : MouseRegion(
                                        onEnter: (event) => setState(() {
                                          iconColorLeft =
                                              Color.fromARGB(255, 5, 5, 5);
                                        }),
                                        onExit: (event) => setState(() {
                                          iconColorLeft = Color.fromARGB(
                                              255, 112, 112, 112);
                                        }),
                                        child: GestureDetector(
                                            child: Container(
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 153, 153, 153)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.0),
                                                  color: isLeftButtonClicked
                                                      ? Color.fromARGB(
                                                          255, 158, 0, 0)
                                                      : null,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Icon(
                                                      IconData(58846,
                                                          fontFamily:
                                                              'MaterialIcons',
                                                          matchTextDirection:
                                                              true),
                                                      size: 35,
                                                      color: isLeftButtonClicked
                                                          ? Color.fromARGB(
                                                              255, 158, 0, 0)
                                                          : iconColorLeft,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 0),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      child: Text('Odd / Vowel',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: isLeftButtonClicked
                                                                  ? Color
                                                                      .fromARGB(
                                                                          255,
                                                                          158,
                                                                          0,
                                                                          0)
                                                                  : Color
                                                                      .fromARGB(
                                                                          255,
                                                                          89,
                                                                          132,
                                                                          166))),
                                                    ),
                                                  ],
                                                ))),
                                      ),
                                this.cueAndStimulus(),
                                instructionStep == 1
                                    ? Container()
                                    : MouseRegion(
                                        onEnter: (event) => setState(() {
                                          iconColorRight =
                                              Color.fromARGB(255, 5, 5, 5);
                                        }),
                                        onExit: (event) => setState(() {
                                          iconColorRight = Color.fromARGB(
                                              255, 112, 112, 112);
                                        }),
                                        child: GestureDetector(
                                            child: Container(
                                                width: 160,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Color.fromARGB(
                                                          255, 153, 153, 153)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.0),
                                                  color: isRightButtonClicked
                                                      ? Color.fromARGB(
                                                          255, 158, 0, 0)
                                                      : null,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 0),
                                                    ),
                                                    Container(
                                                      width: 100,
                                                      child: Text(
                                                          'Even / Consonant',
                                                          textAlign:
                                                              TextAlign.end,
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: isRightButtonClicked
                                                                  ? Color
                                                                      .fromARGB(
                                                                          255,
                                                                          158,
                                                                          0,
                                                                          0)
                                                                  : Color
                                                                      .fromARGB(
                                                                          255,
                                                                          89,
                                                                          132,
                                                                          166))),
                                                    ),
                                                    Icon(
                                                      IconData(58847,
                                                          fontFamily:
                                                              'MaterialIcons',
                                                          matchTextDirection:
                                                              true),
                                                      size: 35,
                                                      color:
                                                          isRightButtonClicked
                                                              ? Color.fromARGB(
                                                                  255,
                                                                  158,
                                                                  0,
                                                                  0)
                                                              : iconColorRight,
                                                    ),
                                                  ],
                                                ))),
                                      )
                              ],
                            ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Column(children: <Widget>[
                          instructionStep == 2
                              ? Text(
                                  "In this example, we have a vowel and an even number.")
                              : Text("")
                        ])),
                    InstructionDescription(
                      setStep: setStep,
                    )
                  ],
                ),
              )
            ])));
  }
}
