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

    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.only(bottom: heightRatio * 10),
        height: heightRatio * 2,
        width: widthRatio * 310,
        color: Color.fromARGB(255, 255, 0, 1),
      ),
      Container(
        margin: EdgeInsets.only(bottom: heightRatio * 10),
        width: widthRatio * 300,
        height: widthRatio * 50,
        child: Text(
          instruction[currentStep - 1],
          style: TextStyle(fontSize: 15),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: heightRatio * 20),
        width: widthRatio * 300,
        child: Text(
          currentStep == 1
              ? "Try to answer as quickly as you can. You will be timed"
              : "",
          style: TextStyle(fontSize: 15),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(bottom: heightRatio * 350),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 135,
                child: ButtonTheme(
                    minWidth: 80,
                    height: 35,
                    disabledColor: Color.fromARGB(255, 255, 0, 1),
                    child: RaisedButton(
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
                      disabledColor: Color.fromARGB(255, 255, 0, 1),
                      child: RaisedButton(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
