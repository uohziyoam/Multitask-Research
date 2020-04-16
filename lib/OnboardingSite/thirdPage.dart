import 'package:MultitaskResearch/OnboardingSite/forthPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThirdPage extends StatefulWidget {
  final String id;
  ThirdPage({Key key, @required this.id}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  void buttonClicked() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => ForthPage(id: widget.id)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: ListView(
      children: <Widget>[
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
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: <
                        Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 80, right: 80),
                      width: width * 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "All research at Stanford University requires that we inform you about the study, tell you about how to contact people at Stanford University if you have any questions, and let you know that your participation is voluntary and that you may withdraw at any time. This is a form that has all of this information.",
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 45, 41, 38)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Please print or save a copy of this page for your records. After you finish reading, please click “next”.",
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 45, 41, 38)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'PROTOCOL DIRECTOR:',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        ' Byron Reeves, 650 856-3644; reeves@stanford.edu, Department of Communication, Stanford University, Stanford, CA 94305-2050.',
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 41, 38)))
                              ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'DESCRIPTION:',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        ' We are doing research about how people use digital devices.  The study will last for 2 weeks. Over the course of the 2 weeks, you will be asked to fill out 2 surveys and install a research application on your phone (described below). You may also be offered some money to change your Internet usage behavior. The recruitment survey you have taken prior to arriving at this page is considered part of the study.',
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 41, 38)))
                              ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "STUDY TASKS:",
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 45, 41, 38)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Text(
                              '1. Install our research software onto your phone, and keep it running on the device. It runs passively, so you will not need to open it or interact with it after installation.',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 45, 41, 38)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Text(
                              '2. Take a 2-minute survey during the study period, for which you will be compensated 5. In this survey, you may be offered additional money to adjust your internet usage behavior, in which case you must choose to accept or decline.',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 45, 41, 38)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Text(
                              '3. Take a final 10-minute survey two weeks from now, after which you will receive 30 of compensation for participating for two weeks.',
                              textAlign: TextAlign.left,
                              softWrap: true,
                              style: TextStyle(
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 45, 41, 38)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'ABOUT OUR SOFTWARE:',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        ' You will be asked to install software on your smartphone that will record the information on your screen every five seconds that your device is turned on for as long as the software remains on the device.  The software will record anything that is on your screen including, for example, home screens, websites, photos, and messages that you send and receive. The software will also collect GPS location data. All of the data that we gather about your device usage will be kept strictly confidential.  We will not use your name to identify your data file, and the data will be encrypted and stored on a secure Stanford server and storage system that will not be accessible to anyone outside of our research project.  We will not share your data with anyone outside of the Stanford project. Identifiers might be removed from identifiable private information and, after such removal, the information could be used for future research studies or distributed to another investigator for future research studies without additional informed consent from you.',
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 41, 38)))
                              ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'DURATION:',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        " If you decide to participate in this study we ask you to participate for 2 weeks.  You may discontinue the study at any time without penalty by removing the software from your device.  You may also ask that your data be removed from our research database by contacting the Protocol Director (contact information above).",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 41, 38)))
                              ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'PAYMENT:',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        " You will be compensated 35 for participation: 30 for the keeping the software on your smartphone for two weeks, and taking a closing survey two weeks from now, plus 5 for filling out a 2-minute survey during the study period.",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 41, 38)))
                              ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'RISKS AND BENEFITS:',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        "Even though data will be stored on a secure Stanford server, there is a minimal risk of data breach and loss of confidentiality.  Most of the data we collect will be analyzed by a computer, but a small portion of the screenshots may be viewed by Stanford researchers if computer analysis is not possible.  Screenshots viewed by a researcher will be viewed only by trained Stanford researchers.  We will not routinely review screenshots while they are collected and in most cases they will not be viewed at all by researchers.  One possible benefit of participation in this research is that you may become more aware about your digital media use.  However, we cannot and do not guarantee or promise that you will receive any benefits from this study.  Based on information gained from this study, if the researchers may have serious concerns relating to matters such as severe depression, physical abuse, etc. or about your health and/or safety, the researchers may contact you and suggest a referral for your care.",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 41, 38)))
                              ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'SUBJECT’S RIGHTS:',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        " If you have read this form and have decided to participate in this project, please understand your participation is voluntary and you have the right to withdraw your consent or discontinue participation at any time without penalty or loss of benefits to which you are otherwise entitled. You have the right to refuse to answer particular questions. Your individual privacy will be maintained in all published and written data resulting from the study.",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 41, 38)))
                              ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'CERTIFICATE OF CONFIDENTIALITY: ',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        "This research is covered by a Certificate of Confidentiality from the National Institutes of Health. This means that the researchers cannot release or use information, documents, or samples that may identify you in any action or suit unless you say it is okay. They also cannot provide them as evidence unless you have agreed.  This protection includes federal, state, or local civil, criminal, administrative, legislative, or other proceedings. An example would be a court subpoena.",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 45, 41, 38))),
                                TextSpan(
                                    text:
                                        "There are some important things that you need to know.  The Certificate DOES NOT stop reporting that federal, state or local laws require. Some examples are laws that require reporting of child or elder abuse, some communicable diseases, and threats to harm yourself or others.  The Certificate CANNOT BE USED to stop a sponsoring United States federal or state government agency from checking records or evaluating programs. The Certificate DOES NOT stop disclosures required by the federal Food and Drug Administration (FDA).  The Certificate also DOES NOT prevent your information from being used for other research if allowed by federal regulations.",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 45, 41, 38))),
                                TextSpan(
                                    text:
                                        "Researchers may release information about you when you say it is okay. For example, you may give them permission to release information to insurers, medical providers or any other persons not connected with the research.  The Certificate of Confidentiality does not stop you from willingly releasing information about your involvement in this research. It also does not prevent you from having access to your own information.",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 41, 38)))
                              ]),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                  text: 'CONTACT INFORMATION:',
                                  style: TextStyle(
                                      fontFamily: "OpenSans",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 45, 41, 38)),
                                ),
                                TextSpan(
                                    text:
                                        ' *Questions, Concerns, or Complaints: If you have any questions, concerns, or complaints about this research study, its procedures, risks and benefits, you should ask the Protocol Director, Byron Reeves, 650 725-3033.',
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color:
                                            Color.fromARGB(255, 45, 41, 38))),
                                TextSpan(
                                    text:
                                        "*Independent Contact: If you are not satisfied with how this study is being conducted, or if you have any concerns, complaints, or general questions about the research or your rights as a participant, please contact the Stanford Institutional Review Board (IRB) to speak to someone independent of the research team at (650)-723-2480 or toll free at 1-866-680-2906. You can also write to the Stanford IRB, Stanford University, 3000 El Camino Real, Five Palo Alto Square, 4th Floor, Palo Alto, CA 94306.",
                                    style: TextStyle(
                                        fontFamily: "OpenSans",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18,
                                        color: Color.fromARGB(255, 45, 41, 38)))
                              ]),
                            ),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 50, bottom: 80),
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
                              ])
                        ],
                      ))
                ])),
          ]),
          Padding(
              padding: EdgeInsets.only(bottom: 180),
              child: Container(
                  height: 1, color: Color.fromRGBO(179, 179, 179, 1))),
        ])
      ],
    ));
  }
}
