import 'dart:async';
import 'dart:convert';
import 'package:MultitaskResearch/instrucption-description.dart';
import 'package:MultitaskResearch/test.dart';
import 'package:flutter/material.dart';

class Instruction extends StatefulWidget {
  final bool isInstruction;
  final String id;
  Instruction({Key key, @required this.isInstruction, this.id})
      : super(key: key);

  @override
  _InstructionState createState() => _InstructionState();
}

class _InstructionState extends State<Instruction> {
  Timer timer1, timer2;
  Stopwatch stopwatch;
  var widthRatio, heightRatio;
  bool isCue = false, isStimulus = false, isButtonClicked = false;
  int currentLevel = 1, totalLevels = 999, instructionStep = 1;

  List<CueStimulus> numberLetter;

  @override
  void initState() {
    super.initState();
    buttonClicked();
    loadGameData(widget.isInstruction).then((s) => setState(() {
          numberLetter = s.list;
          totalLevels = s.list.length;
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
      isButtonClicked = true;
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
          isButtonClicked = false;
          stopwatch.start();
          buttonClicked();
        });
      });
    });
  }

  Widget cueAndStimulus() {
    if (isCue) {
      return Container(
          margin: EdgeInsets.only(top: heightRatio * 10),
          child: Text(
            "${numberLetter[currentLevel - 1].type}",
            style: TextStyle(fontSize: 120),
          ));
    }

    if (isStimulus) {
      return Container(
          margin: EdgeInsets.only(top: heightRatio * 10),
          child: Text(
            "${numberLetter[currentLevel - 1].stimulus}",
            style: TextStyle(fontSize: 120),
          ));
    }

    return Container(
        margin: EdgeInsets.only(top: heightRatio * 10),
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
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        LinearProgressIndicator(
          value: currentLevel / 3,
        ),
        Text("$currentLevel"),
        Padding(
          padding: EdgeInsets.only(top: heightRatio * 300),
          child: instructionStep == 3
              ? Container(
                  width: 165,
                  child: ButtonTheme(
                      minWidth: widthRatio * 100,
                      height: 35,
                      disabledColor: Color.fromARGB(255, 255, 0, 1),
                      child: RaisedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Start the Test',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20)),
                            ],
                          ))))
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    instructionStep == 1
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(left: widthRatio * 225),
                            child: Container(
                                width: 165,
                                child: ButtonTheme(
                                    padding: EdgeInsets.only(right: 30),
                                    minWidth: widthRatio * 80,
                                    height: 35,
                                    disabledColor:
                                        Color.fromARGB(255, 255, 0, 1),
                                    child: RaisedButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Icon(
                                              IconData(58846,
                                                  fontFamily: 'MaterialIcons',
                                                  matchTextDirection: true),
                                              size: 35,
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 00),
                                            ),
                                            Container(
                                              width: 100,
                                              child: Text('Odd / Vowel',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                            ),
                                          ],
                                        ))))),
                    this.cueAndStimulus(),
                    instructionStep == 1
                        ? Container()
                        : Padding(
                            padding: EdgeInsets.only(right: widthRatio * 225),
                            child: Container(
                                width: 165,
                                child: ButtonTheme(
                                    padding: EdgeInsets.only(left: 30),
                                    minWidth: widthRatio * 80,
                                    height: 35,
                                    disabledColor:
                                        Color.fromARGB(255, 255, 0, 1),
                                    child: RaisedButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 100,
                                              child: Text('Even / Consonant',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 20)),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 00),
                                            ),
                                            Icon(
                                              IconData(58847,
                                                  fontFamily: 'MaterialIcons',
                                                  matchTextDirection: true),
                                              size: 35,
                                            )
                                          ],
                                        )))),
                          ),
                  ],
                ),
        ),
        InstructionDescription(
          setStep: setStep,
        )
      ],
    ));
  }
}
