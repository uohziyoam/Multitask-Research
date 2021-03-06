import 'package:MultitaskResearch/OnboardingSite/secondPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstPage extends StatefulWidget {
  final String id;
  FirstPage({Key key, @required this.id}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void buttonClicked() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => SecondPage(id: widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView(children: <Widget>[
      Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                  color: Color.fromRGBO(204, 0, 0, 1),
                  height: 35,
                  width: double.infinity,
                  child: Row(children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: width * 0.1),
                        child: Text(
                          "Boston University",
                          style: TextStyle(
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.white),
                        ))
                  ])),
              Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Container(
                      height: 1, color: Color.fromRGBO(179, 179, 179, 1))),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: width * 0.8,
                          child: Image.asset("assets/bostonuniverisy.jpg"))
                    ]),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: width * 0.8,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Text(
                                    "This study is run by Boston University.",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 32,
                                        color: Color.fromARGB(255, 45, 41, 38)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "1. Install an app on your phone",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color.fromARGB(255, 45, 41, 38)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "2. Keep it for 2 weeks, for science!",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color.fromARGB(255, 45, 41, 38)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "3. We gratefully offer 30, for time and effort",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color.fromARGB(255, 45, 41, 38)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Click the red button to begin.",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 32,
                                        color: Color.fromARGB(255, 45, 41, 38)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 50),
                                  child: Text(
                                    "Qualtrics finishing passcode: " +
                                        "${widget.id}",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28,
                                        color:
                                            Color.fromARGB(255, 51, 153, 102)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 50, bottom: 50),
                                  child: ButtonTheme(
                                    minWidth: 300.0,
                                    height: 55.0,
                                    child: RaisedButton(
                                      child: Text(
                                        "Next",
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        style: TextStyle(
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 28,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: this.buttonClicked,
                                      color: Color.fromRGBO(204, 0, 0, 1),
                                      splashColor: Color.fromRGBO(204, 0, 0, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ])),
            ]),
            Padding(
                padding: EdgeInsets.only(bottom: 120),
                child: Container(
                    height: 1, color: Color.fromRGBO(179, 179, 179, 1))),
          ])
    ]);
  }
}
