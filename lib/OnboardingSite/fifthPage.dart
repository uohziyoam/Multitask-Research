import 'package:MultitaskResearch/OnboardingSite/thirdPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FifthPage extends StatefulWidget {
  final String id;
  FifthPage({Key key, @required this.id}) : super(key: key);

  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  void buttonClicked() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => ThirdPage(id: widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Column(
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
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  "You will be sent 30 via PayPal as a thank-you for keeping the app running for 2 weeks.",
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
                                  "Further clarification will come from",
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
                                  "yizhoum@bu.edu",
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
                                child: RichText(
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Please open all emails',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32,
                                          color:
                                              Color.fromARGB(255, 45, 41, 38)),
                                    ),
                                    TextSpan(
                                        text: ' from ',
                                        style: TextStyle(
                                            fontFamily: "OpenSans",
                                            fontWeight: FontWeight.normal,
                                            fontSize: 32,
                                            color: Color.fromARGB(
                                                255, 45, 41, 38))),
                                    TextSpan(
                                      text: 'yizhoum@bu.edu',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 32,
                                          color:
                                              Color.fromARGB(255, 45, 41, 38)),
                                    ),
                                  ]),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 50),
                                child: Text(
                                  "Thank you, you’re now free to leave this site. You can bookmark this page.",
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32,
                                      color: Color.fromARGB(255, 45, 41, 38)),
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
        ]));
  }
}
