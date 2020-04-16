import 'package:MultitaskResearch/OnboardingSite/fifthPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForthPage extends StatefulWidget {
  final String id;
  ForthPage({Key key, @required this.id}) : super(key: key);

  @override
  _ForthPageState createState() => _ForthPageState();
}

class _ForthPageState extends State<ForthPage> {
  void buttonClicked() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => FifthPage(id: widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: ListView(children: <Widget>[
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
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
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                      Widget>[
                Container(
                    width: width * 0.8,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            "The app is called ‘Boston Terrier’, on the Google Play store. Please download and install. The icon looks like this:",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.normal,
                                fontSize: 32,
                                color: Color.fromARGB(255, 45, 41, 38)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    width: width * 0.8,
                                    child: Image.asset(
                                        "assets/bostonuniverisy.jpg"))
                              ]),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 85),
                            child: Container(
                                height: 1,
                                color: Color.fromRGBO(179, 179, 179, 1))),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Open the app and type in this information:",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.normal,
                                fontSize: 32,
                                color: Color.fromARGB(255, 45, 41, 38)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Code:',
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: Color.fromARGB(255, 45, 41, 38)),
                              ),
                              TextSpan(
                                  text: ' W3',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 32,
                                      color: Color.fromARGB(255, 45, 41, 38)))
                            ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Number: ',
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: Color.fromARGB(255, 45, 41, 38)),
                              ),
                              TextSpan(
                                  text: ' ${widget.id}',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 32,
                                      color: Color.fromARGB(255, 45, 41, 38)))
                            ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Email:',
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: Color.fromARGB(255, 45, 41, 38)),
                              ),
                              TextSpan(
                                  text: ' Your true email address.',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 32,
                                      color: Color.fromARGB(255, 45, 41, 38)))
                            ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                text: 'Password:',
                                style: TextStyle(
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: Color.fromARGB(255, 45, 41, 38)),
                              ),
                              TextSpan(
                                  text: ' W3',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.normal,
                                      fontSize: 32,
                                      color: Color.fromARGB(255, 45, 41, 38)))
                            ]),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Then tap ‘CREATE ACCOUNT’",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.normal,
                                fontSize: 32,
                                color: Color.fromARGB(255, 45, 41, 38)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Make sure your email address is correct.",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                                fontSize: 28,
                                color: Color.fromARGB(255, 45, 41, 38)),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 85),
                            child: Container(
                                height: 1,
                                color: Color.fromRGBO(179, 179, 179, 1))),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Next, approve image-capture by following the prompts.",
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                                fontFamily: "OpenSans",
                                fontWeight: FontWeight.normal,
                                fontSize: 32,
                                color: Color.fromARGB(255, 45, 41, 38)),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Container(
                                height: 1,
                                color: Color.fromRGBO(179, 179, 179, 1))),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
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
          padding: EdgeInsets.only(top: 50),
          child: Text(
            "You can email yizhoum@bu.edu for assistance. Use subject line: W3",
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.normal,
                fontSize: 25,
                color: Color.fromARGB(255, 45, 41, 38)),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 50, bottom: 120),
            child:
                Container(height: 1, color: Color.fromRGBO(179, 179, 179, 1))),
      ])
    ]));
  }
}
