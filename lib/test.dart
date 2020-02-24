import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:MultitaskResearch/CueStimulus.dart';
import 'package:MultitaskResearch/end.dart';
import 'package:MultitaskResearch/login.dart';
import 'package:MultitaskResearch/randomAlgo.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

Future<List<CueStimulus>> loadData() async {
  return execuate();
}

List<CueStimulus> execuate() {
  RandomAlgorithm randomAlgorithm = new RandomAlgorithm();
  List<int> ranSequence = randomSequence(8) +
      randomSequence(8) +
      randomSequence(8) +
      randomSequence(8);

  for (int i = 0; i < 32; i++) {
    switch (ranSequence[i]) {
      case 0:
        randomAlgorithm.generateConsecutiveTask(1, "LETTER");
        break;
      case 1:
        randomAlgorithm.generateConsecutiveTask(1, "NUMBER");
        break;
      case 2:
        randomAlgorithm.generateConsecutiveTask(2, "LETTER");
        break;
      case 3:
        randomAlgorithm.generateConsecutiveTask(2, "NUMBER");
        break;
      case 4:
        randomAlgorithm.generateConsecutiveTask(3, "LETTER");
        break;
      case 5:
        randomAlgorithm.generateConsecutiveTask(3, "NUMBER");
        break;
      case 6:
        randomAlgorithm.generateConsecutiveTask(4, "LETTER");
        break;
      case 7:
        randomAlgorithm.generateConsecutiveTask(4, "NUMBER");
        break;
    }
  }

  randomAlgorithm.flip();

  // randomAlgorithm.config.forEach((element) {
  //   print(element.type + " " + element.switchSinceSwitch.toString());
  // });

  return randomAlgorithm.config;
}

List<int> randomSequence(int maxInt) {
  List<int> odd = [1, 3, 5, 7];
  List<int> even = [0, 2, 4, 6];

  List<int> randomEven = [];
  List<int> randomOdd = [];
  List<int> randomSequence = [];
  Random random = Random();

  while (randomEven.length != 4) {
    int nextRandom = random.nextInt(4);
    if (randomEven.contains(even[nextRandom])) {
      continue;
    }
    randomEven.add(even[nextRandom]);
  }

  while (randomOdd.length != 4) {
    int nextRandom = random.nextInt(4);
    if (randomOdd.contains(odd[nextRandom])) {
      continue;
    }
    randomOdd.add(odd[nextRandom]);
  }

  for (var i = 0; i < 4; i++) {
    randomSequence.add(randomEven[i]);
    randomSequence.add(randomOdd[i]);
  }

  return randomSequence;
}

class Test extends StatefulWidget {
  final bool isUnscored;
  final String id;
  final List practiceWidgetRes;
  Test(
      {Key key,
      @required this.isUnscored,
      @required this.id,
      this.practiceWidgetRes})
      : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final fs.Firestore firestore = fb.firestore();
  Timer timer1, timer2, timer3, timer4, timer5;
  Stopwatch stopwatch;
  var widthRatio, heightRatio;
  bool isCue = false,
      isStimulus = false,
      isButtonClicked = false,
      isLeftButtonClicked = false,
      isRightButtonClicked = false,
      isEnd = false;
  int currentLevel = 0, totalLevels = 999, instructionStep = 1;
  FocusNode focusNode = FocusNode();

  List res = [];
  List practiceRes = [];

  List<CueStimulus> numberLetter;
  Color iconColorRight = Color.fromARGB(255, 112, 112, 112);
  Color iconColorLeft = Color.fromARGB(255, 112, 112, 112);

  @override
  void initState() {
    super.initState();
    loadData().then((s) => setState(() {
          numberLetter = s;
          totalLevels = s.length;
        }));
    buttonClicked(true);
  }

  @override
  void dispose() {
    timer1?.cancel();
    timer2?.cancel();
    timer3?.cancel();
    timer4?.cancel();
    timer5?.cancel();
    stopwatch.stop();
    super.dispose();
  }

  void stopWatchPrint() {
    if (stopwatch != null && stopwatch.isRunning) {
      // print("${stopwatch.elapsedMilliseconds}");
    }
  }

  void wrapResult(bool isLeft) {
    Map<String, dynamic> mp = {
      "switchingCost": stopwatch.elapsedMilliseconds,
      "isCorrect": numberLetter[currentLevel - 1].isOddOrVowl == isLeft,
      "isSwitchedTask": numberLetter[currentLevel - 1].isSwitchedTask,
      "type": numberLetter[currentLevel - 1].type,
      "stimulus": numberLetter[currentLevel - 1].stimulus,
      "partition": numberLetter[currentLevel - 1].partition,
      "exceedThresh": stopwatch.elapsedMilliseconds >= 10000 ? true : false,
      "testsSinceSwitch": numberLetter[currentLevel - 1].testsSinceSwitch
    };

    if (!widget.isUnscored) {
      // print("there");
      res.add(mp);
    }

    if (widget.isUnscored) {
      // print("here");
      practiceRes.add(mp);
    }
  }

  bool isTestEnd() {
    if (!isEnd && currentLevel == 6 && widget.isUnscored) {
      // jump to new game
      setState(() {
        isEnd = true;
      });

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Test(
                  isUnscored: false,
                  id: widget.id,
                  practiceWidgetRes: practiceRes)));
      return true;
    }

    if (!isEnd && currentLevel == 80 && !widget.isUnscored) {
      setState(() {
        isEnd = true;
      });

      // send to server
      DateTime now = DateTime.now();
      Map<String, dynamic> mp = {
        "id": widget.id,
        "res": res,
        "practice_res": widget.practiceWidgetRes,
        "test_time": now.toIso8601String()
      };
      firestore
          .collection('multitask')
          .add(mp)
          .then((value) => print(value))
          .catchError((onError) => print(onError));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => End()));
      return true;
    }
    return false;
  }

  void buttonClicked(bool isLeft) {
    if (!isEnd && currentLevel != 0) {
      wrapResult(isLeft);
    }
    if (isTestEnd()) {
      return;
    }

    setState(() {
      isButtonClicked = true;
      isCue = false;
      isStimulus = false;
      currentLevel += 1;
    });
    stopwatch = new Stopwatch();

    timer1 = new Timer(
        Duration(
            milliseconds:
                (widget.isUnscored && currentLevel == 1) ? 950 * 2 : 950), () {
      setState(() {
        isCue = true;
        isStimulus = false;
      });
      timer2 = new Timer(const Duration(milliseconds: 200), () {
        setState(() {
          isCue = false;
          isStimulus = false;
        });
        timer3 = new Timer(Duration(milliseconds: 226), () {
          setState(() {
            isCue = false;
            isStimulus = true;
            isButtonClicked = false;
            stopwatch.start();
          });
        });
      });
    });
  }

  Widget cueAndStimulus() {
    if (isCue) {
      return Container(
          width: 350,
          alignment: Alignment(0.0, 0.0),
          height: 150,
          margin: EdgeInsets.only(top: heightRatio * 10),
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
          margin: EdgeInsets.only(top: heightRatio * 10),
          child: Text(
            "${numberLetter[currentLevel - 1].stimulus}",
            style: TextStyle(fontSize: 120),
          ));
    }

    return Container(
        width: 350,
        alignment: Alignment(0.0, 0.0),
        height: 150,
        margin: EdgeInsets.only(top: heightRatio * 10),
        child: Text(
          "  ",
          style: TextStyle(fontSize: 120),
        ));
  }

  String letterNumber() {
    if (numberLetter[currentLevel - 1].type.toUpperCase() == "NUMBER") {
      return numberLetter[currentLevel - 1].isOddOrVowl ? "odd" : "even";
    }

    if (numberLetter[currentLevel - 1].type.toUpperCase() == "LETTER") {
      return numberLetter[currentLevel - 1].isOddOrVowl ? "vowel" : "consonant";
    }
    return "vowel";
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
              if (value.data.keyLabel == "ArrowLeft") {
                setState(() {
                  isLeftButtonClicked = true;
                  timer4 = Timer(const Duration(milliseconds: 200), () {
                    setState(() {
                      isLeftButtonClicked = false;
                    });
                    timer5 = new Timer(const Duration(milliseconds: 76), () {
                      if (!isButtonClicked) {
                        buttonClicked(true);
                      }
                    });
                  });
                });
              }

              if (value.data.keyLabel == "ArrowRight") {
                setState(() {
                  isRightButtonClicked = true;
                  timer4 = Timer(const Duration(milliseconds: 200), () {
                    setState(() {
                      isRightButtonClicked = false;
                    });
                    timer5 = new Timer(const Duration(milliseconds: 76), () {
                      if (!isButtonClicked) {
                        buttonClicked(false);
                      }
                    });
                  });
                });
              }
              // bool isKeyUp =
              //     value.toDiagnosticsNode().toString().split("#").first ==
              //         "RawKeyUpEvent";

              // bool isKeyDown =
              //     value.toDiagnosticsNode().toString().split("#").first ==
              //         "RawKeyDownEvent";

              // if (value.data.keyLabel == "ArrowLeft" && !isEnd) {
              //   setState(() {
              //     if (isKeyDown) {
              //       isLeftButtonClicked = true;
              //     }
              //     if (isKeyUp) {
              //       isLeftButtonClicked = false;
              //     }
              //   });

              //   timer4 = new Timer(const Duration(milliseconds: 76), () {
              //     if (!isButtonClicked) {
              //       buttonClicked(true);
              //     }
              //   });
              // }

              // if (value.data.keyLabel == "ArrowRight" && !isEnd) {
              //   setState(() {
              //     if (isKeyDown) {
              //       isRightButtonClicked = true;
              //     }
              //     if (isKeyUp) {
              //       isRightButtonClicked = false;
              //     }
              //   });

              //   timer4 = new Timer(const Duration(milliseconds: 76), () {
              //     if (!isButtonClicked) {
              //       buttonClicked(true);
              //     }
              //   });
              // }
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              Container(
                  alignment: AlignmentDirectional.center,
                  width: 700,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 204, 204, 204)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  widget.isUnscored
                                      ? "Practice Task ${currentLevel == 7 ? 6 : currentLevel} of 6"
                                      : "Task $currentLevel of $totalLevels",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 18, 18, 18),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              widget.isUnscored
                                  ? LinearProgressIndicator(
                                      value: currentLevel / 6)
                                  : Container(),
                            ],
                          )),
                      Column(children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            isButtonClicked
                                ? Container()
                                : MouseRegion(
                                    onEnter: (event) => setState(() {
                                      iconColorLeft =
                                          Color.fromARGB(255, 5, 5, 5);
                                    }),
                                    onExit: (event) => setState(() {
                                      iconColorLeft =
                                          Color.fromARGB(255, 112, 112, 112);
                                    }),
                                    child: GestureDetector(
                                        onTapDown: (details) => setState(() {
                                              isLeftButtonClicked = true;
                                            }),
                                        onTapUp: (details) => setState(() {
                                              isLeftButtonClicked = false;
                                            }),
                                        onTap: isButtonClicked
                                            ? null
                                            : () {
                                                this.stopWatchPrint();
                                                this.buttonClicked(true);
                                              },
                                        child: Container(
                                            height: 50,
                                            width: 165,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 153, 153, 153)),
                                              borderRadius:
                                                  BorderRadius.circular(1.0),
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
                                                Transform(
                                                    alignment: Alignment.center,
                                                    transform:
                                                        Matrix4.rotationY(pi),
                                                    child: Icon(
                                                      MdiIcons.play,
                                                      size: 35,
                                                      color: isLeftButtonClicked
                                                          ? Color.fromARGB(
                                                              255, 158, 0, 0)
                                                          : iconColorLeft,
                                                    )),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(right: 0),
                                                ),
                                                Container(
                                                  width: 100,
                                                  child: Text('Odd / Vowel',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color:
                                                              isLeftButtonClicked
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
                            isButtonClicked
                                ? Container()
                                : MouseRegion(
                                    onEnter: (event) => setState(() {
                                      iconColorRight =
                                          Color.fromARGB(255, 5, 5, 5);
                                    }),
                                    onExit: (event) => setState(() {
                                      iconColorRight =
                                          Color.fromARGB(255, 112, 112, 112);
                                    }),
                                    child: GestureDetector(
                                        onTapDown: (details) => setState(() {
                                              isRightButtonClicked = true;
                                            }),
                                        onTapUp: (details) => setState(() {
                                              isRightButtonClicked = false;
                                            }),
                                        onTap: isButtonClicked
                                            ? null
                                            : () {
                                                this.stopWatchPrint();
                                                this.buttonClicked(false);
                                              },
                                        child: Container(
                                            height: 50,
                                            width: 165,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 153, 153, 153)),
                                              borderRadius:
                                                  BorderRadius.circular(1.0),
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
                                                  padding:
                                                      EdgeInsets.only(right: 0),
                                                ),
                                                Container(
                                                  width: 100,
                                                  child: Text(
                                                      'Even / Consonant',
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color:
                                                              isRightButtonClicked
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
                                                  MdiIcons.play,
                                                  size: 35,
                                                  color: isRightButtonClicked
                                                      ? Color.fromARGB(
                                                          255, 158, 0, 0)
                                                      : iconColorRight,
                                                ),
                                              ],
                                            ))),
                                  )
                          ],
                        ),
                        widget.isUnscored
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: 50, bottom: heightRatio * 500),
                                child: isButtonClicked
                                    ? Column(
                                        children: <Widget>[Text(""), Text("")])
                                    : Column(children: <Widget>[
                                        Text(
                                            "This is a ${numberLetter[currentLevel - 1].type.toUpperCase()} task. The pair above contains a ${letterNumber()}."),
                                        Text(
                                            "Press the ${numberLetter[currentLevel - 1].isOddOrVowl ? "LEFT" : "RIGHT"} key or button."),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: widget.isUnscored &&
                                                    currentLevel == 1
                                                ? 20
                                                : 0,
                                          ),
                                        ),
                                        widget.isUnscored && currentLevel == 6
                                            ? Text(
                                                "The actual test begins immediately on the next screen.")
                                            : Container(),
                                        widget.isUnscored && currentLevel == 6
                                            ? Text(
                                                "Remember to answer as quickly as you can.")
                                            : Container(),
                                        // Icon(
                                        // MdiIcons.play,
                                        //   size: 100,
                                        // ),
                                      ]))
                            : Container(
                                padding: EdgeInsets.only(
                                    top: 50, bottom: heightRatio * 525),
                              ),
                      ])
                    ],
                  ))
            ])));
  }
}
