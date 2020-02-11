import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InstructionDescription extends StatefulWidget {
  Function setStep;
  InstructionDescription({Key key, @required this.setStep}) : super(key: key);

  @override
  _InstructionDescriptionState createState() => _InstructionDescriptionState();
}

class _InstructionDescriptionState extends State<InstructionDescription> {
  var widthRatio, heightRatio;
  int currentStep = 1;
  List<String> instruction = [
    "This test measures how easily you switch between tasks. You will be asked to determine whether a letter is a vowel or a consonant, or whether a number is odd or even. Sometimes you will be asked to focus on the letter, and sometimes on the number.",
    "You will see the word LETTER or NUMBER, which tells you which to focus on, then a letter-number pair. If the word was LETTER, Click the left button to indicate a vowel and the right for a consonant. If the word was NUMBER, click the left button to indicate odd, and the right for even. You can also use the left and right arrow keys on your keyboard.",
    "You will first do 6 unscored practice tests and then 80 scored tests."
  ];

  @override
  Widget build(BuildContext context) {
    widthRatio = MediaQuery.of(context).size.width / 768;
    heightRatio = MediaQuery.of(context).size.height / 1024;

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 2,
            width: 550,
            color: Color.fromARGB(255, 204, 204, 204),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            width: 550,
            height: 100,
            child: Text(
              instruction[currentStep - 1],
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: 550,
            child: Text(
              currentStep == 1
                  ? "Try to answer as quickly as you can. You will be timed"
                  : "",
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 135,
                    child: ButtonTheme(
                        minWidth: 80,
                        height: 35,
                        disabledColor: Color.fromARGB(255, 247, 247, 247),
                        child: RaisedButton(
                          elevation: 0,
                          focusElevation: 0,
                          hoverElevation: 0,
                          disabledElevation: 0,
                          highlightElevation: 0,
                          color: Color.fromARGB(255, 255, 255, 255),
                          textColor: Color.fromARGB(255, 89, 132, 166),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 153, 153, 153))),
                          onPressed: currentStep == 1
                              ? null
                              : () {
                                  setState(() {
                                    if (currentStep == 1) {
                                    } else if (currentStep == 2) {
                                      currentStep -= 1;
                                    } else if (currentStep == 3) {
                                      currentStep -= 1;
                                    }
                                    widget.setStep(currentStep);
                                  });
                                },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                IconData(58846,
                                    fontFamily: 'MaterialIcons',
                                    matchTextDirection: true),
                                size: 25,
                                color: currentStep == 1
                                    ? null
                                    : Color.fromARGB(255, 51, 51, 51),
                              ),
                              Text('Previous',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20)),
                              Padding(
                                padding: EdgeInsets.only(right: 00),
                              ),
                            ],
                          ),
                        ))),
                Padding(
                    padding: EdgeInsets.only(left: widthRatio * 20),
                    child: Container(
                      width: 135,
                      child: ButtonTheme(
                          minWidth: 80,
                          height: 35,
                          disabledColor: Color.fromARGB(255, 247, 247, 247),
                          child: RaisedButton(
                              elevation: 0,
                              focusElevation: 0,
                              hoverElevation: 0,
                              textColor: Color.fromARGB(255, 89, 132, 166),
                              disabledElevation: 0,
                              highlightElevation: 0,
                              color: Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color:
                                          Color.fromARGB(255, 153, 153, 153))),
                              onPressed: currentStep == 3
                                  ? null
                                  : () {
                                      setState(() {
                                        if (currentStep == 1) {
                                          currentStep += 1;
                                        } else if (currentStep == 2) {
                                          currentStep += 1;
                                        } else if (currentStep == 3) {}
                                        widget.setStep(currentStep);
                                      });
                                    },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 00),
                                  ),
                                  Text('Next',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20)),
                                  Icon(
                                    IconData(58847,
                                        fontFamily: 'MaterialIcons',
                                        matchTextDirection: true),
                                    size: 25,
                                    color: currentStep == 3
                                        ? null
                                        : Color.fromARGB(255, 51, 51, 51),
                                  )
                                ],
                              ))),
                    ))
              ],
            ),
          )
        ]);
  }
}
