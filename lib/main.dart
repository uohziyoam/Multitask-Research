import 'dart:async';
import 'dart:html';
import 'package:MultitaskResearch/FocusTest/InstructionPage.dart';
import 'package:MultitaskResearch/FocusTest/OrderedSquares.dart';
import 'package:MultitaskResearch/FocusTest/SquareAnimation.dart';
import 'package:MultitaskResearch/FocusTest/TestPage.dart';
import 'package:MultitaskResearch/FocusTest/instructionContent.dart';
import 'package:MultitaskResearch/FocusTest/login.dart';
import 'package:MultitaskResearch/FocusTest/square.dart';
import 'package:MultitaskResearch/KEYS.dart';
import 'package:MultitaskResearch/MultiTask/HomePage.dart';
import 'package:MultitaskResearch/MultiTask/instruction.dart';
import 'package:MultitaskResearch/MultiTask/login.dart';
import 'package:MultitaskResearch/OnboardingSite/firstPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as Firebase;
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  if (Firebase.apps.isEmpty) {
    Firebase.initializeApp(
        apiKey: KEYS.apiKey,
        authDomain: KEYS.authDomain,
        databaseURL: KEYS.databaseURL,
        projectId: KEYS.projectId,
        storageBucket: KEYS.storageBucket,
        messagingSenderId: KEYS.messagingSenderId,
        appId: KEYS.appId,
        measurementId: KEYS.measurementId);
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HCI Research',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/testfocus',
      onGenerateRoute: generateRoute,
    );
  }
}

class RoutingData {
  final String route;
  final Map<String, String> _queryParameters;

  RoutingData({
    this.route,
    Map<String, String> queryParameters,
  }) : _queryParameters = queryParameters;

  operator [](String key) => _queryParameters[key];
}

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    print('queryParameters: ${uriData.queryParameters} path: ${uriData.path}');
    return RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );
  }
}

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name.getRoutingData;
  switch (routingData.route) {
    case '/home':
      return MaterialPageRoute(builder: (_) => MyHomePage());
    case '/exercisets':
      return MaterialPageRoute(
          builder: (_) => MultiTaskLogin(
                id: routingData._queryParameters["id"],
              ));
    case '/testfocus':
      return MaterialPageRoute(
          builder: (_) => TestFocusLogin(
                id: routingData._queryParameters["id"],
              ));
      return MaterialPageRoute(
        builder: (_) => TestPage(
          title: "Test",
          id: routingData._queryParameters["id"],
          practiceTestRes: [],
        ),
        // builder: (_) => InstructionPage(
        //   title: "Test",
        //   totalLevel: 3,
        //   content: Container(),
        //   id: routingData._queryParameters["id"],
        // ),
      );
    case '/instruction':
      return MaterialPageRoute(
          builder: (_) => Instruction(
                id: routingData._queryParameters["id"],
              ));
    case '/onboarding':
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                  body: FirstPage(
                id: routingData._queryParameters["id"],
              )));
    case '/exportts':
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: RaisedButton(
              onPressed: () async {
                const url =
                    'https://us-central1-common-research.cloudfunctions.net/csvJsonReport';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text('Export the data'),
            ),
          ),
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
