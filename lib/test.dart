import 'dart:async';
import 'dart:convert';
import 'package:MultitaskResearch/end.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;

class CueStimulus {
  final String stimulus;
  final String type;
  final bool isSwitchedTask;
  final bool isOddOrVowl;

  CueStimulus(
      {this.stimulus, this.type, this.isSwitchedTask, this.isOddOrVowl});

  factory CueStimulus.fromJson(Map parsedJson) {
    return CueStimulus(
        stimulus: parsedJson['stimulus'],
        type: parsedJson['type'],
        isSwitchedTask: parsedJson['isSwitchedTask'],
        isOddOrVowl: parsedJson['isOddOrVowl']);
  }
}

class ListOfCueStimulus {
  final List<CueStimulus> list;

  ListOfCueStimulus({this.list});

  factory ListOfCueStimulus.fromJson(List listOfData) {
    List<CueStimulus> res = [];

    for (var data in listOfData) {
      res.add(CueStimulus.fromJson(data));
    }

    return ListOfCueStimulus(list: res);
  }
}

Future<String> _loadGameDataAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

Future<ListOfCueStimulus> loadGameData(isInstruction) async {
  String jsonString = await _loadGameDataAsset();
  final jsonResponse = json.decode(jsonString);
  List list;

  if (isInstruction) {
    list = jsonResponse["unscored"] as List;
  } else {
    list = jsonResponse["scored"] as List;
  }

  return ListOfCueStimulus.fromJson(list);
}

class Test extends StatefulWidget {
  final bool isUnscored;
  final String id;
  Test({Key key, @required this.isUnscored, this.id}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final fs.Firestore firestore = fb.firestore();
  Timer timer1, timer2;
  Stopwatch stopwatch;
  var widthRatio, heightRatio;
  bool isCue = false, isStimulus = false, isButtonClicked = false;
  int currentLevel = 0, totalLevels = 999, instructionStep = 1;

  List res = [];

  // Map map = {
  //   "id": "21334", // widget.id
  //   "res": [
  //     {
  //       "switchingCost": 52, //reactionTime stopwatch.elapsedMilliseconds
  //       "isCorrect":
  //           false, // CueStimulus.isOddOrVowl == left(true) || CueStimulus.isEvenOrConsonant == right(false)
  //       "isSwitchedTask": true, // CusStimulus.isSwitchedTask
  //       "type": "letter" // CusStimulus.type
  //     }
  //   ]
  // };

  List<CueStimulus> numberLetter;

  @override
  void initState() {
    super.initState();
    loadGameData(widget.isUnscored).then((s) => setState(() {
          numberLetter = s.list;
          totalLevels = s.list.length;
        }));
    buttonClicked(true);
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

  void wrapResult(bool isLeft) {
    Map<String, dynamic> mp = {
      "switchingCost": stopwatch.elapsedMilliseconds,
      "isCorrect": numberLetter[currentLevel - 1].isOddOrVowl == isLeft,
      "isSwitchedTask": numberLetter[currentLevel - 1].isSwitchedTask,
      "type": numberLetter[currentLevel - 1].type
    };

    res.add(mp);
  }

  bool isTestEnd() {
    if (currentLevel == 5 && widget.isUnscored) {
      // jump to new game

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Test(
                    isUnscored: false,
                    id: widget.id,
                  )));
      return true;
    }

    if (currentLevel == 80 && !widget.isUnscored) {
      // send to server
      Map<String, dynamic> mp = {"id": widget.id, "res": res};
      firestore
          .collection('multitask')
          .add(mp)
          .then((value) => print(value))
          .catchError((onError) => print(onError));
      Navigator.push(context, MaterialPageRoute(builder: (context) => End()));
      return true;
    }
    return false;
  }

  void buttonClicked(bool isLeft) {
    stopwatch = new Stopwatch();
    if (currentLevel != 0) {
      wrapResult(isLeft);
    }
    if (isTestEnd()) {
      return;
    }

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
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: widthRatio * 768,
              height: 20,
              color: Colors.red,
              child: Text(
                "Instructions $currentLevel of $totalLevels",
                textAlign: TextAlign.center,
              ),
            ),
            LinearProgressIndicator(
              value: currentLevel / totalLevels,
            ),
          ],
        ),
        Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                isButtonClicked
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(left: widthRatio * 225),
                        child: Container(
                            width: 165,
                            child: ButtonTheme(
                                padding: EdgeInsets.only(right: 30),
                                minWidth: widthRatio * 80,
                                height: 35,
                                disabledColor: Color.fromARGB(255, 255, 0, 1),
                                child: RaisedButton(
                                    onPressed: isButtonClicked
                                        ? null
                                        : () {
                                            this.stopWatchPrint();
                                            this.buttonClicked(true);
                                          },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Icon(
                                          IconData(58846,
                                              fontFamily: 'MaterialIcons',
                                              matchTextDirection: true),
                                          size: 35,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 00),
                                        ),
                                        Container(
                                          width: 100,
                                          child: Text('Odd / Vowel',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20)),
                                        ),
                                      ],
                                    ))))),
                this.cueAndStimulus(),
                isButtonClicked
                    ? Container()
                    : Padding(
                        padding: EdgeInsets.only(right: widthRatio * 225),
                        child: Container(
                            width: 165,
                            child: ButtonTheme(
                                padding: EdgeInsets.only(left: 30),
                                minWidth: widthRatio * 80,
                                height: 35,
                                disabledColor: Color.fromARGB(255, 255, 0, 1),
                                child: RaisedButton(
                                    onPressed: isButtonClicked
                                        ? null
                                        : () {
                                            this.stopWatchPrint();
                                            this.buttonClicked(false);
                                          },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          child: Text('Even / Consonant',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20)),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 00),
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
          Padding(
              padding: EdgeInsets.only(bottom: heightRatio * 500),
              child: isButtonClicked
                  ? Column(children: <Widget>[Text(""), Text("")])
                  : Column(children: <Widget>[
                      Text(
                          "This is a ${numberLetter[currentLevel - 1].type.toUpperCase()} task. The pair above contains a ${letterNumber()}."),
                      Text(
                          "Press the ${numberLetter[currentLevel - 1].isOddOrVowl ? "LEFT" : "RIGHT"} key or button.")
                    ]))
        ])
      ],
    ));
  }
}
