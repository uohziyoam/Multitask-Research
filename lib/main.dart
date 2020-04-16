import 'dart:async';
import 'dart:collection';
import 'dart:html';
import 'package:MultitaskResearch/FocusTest/TestPage.dart';
import 'package:MultitaskResearch/FocusTest/gridContent.dart';
import 'package:MultitaskResearch/FocusTest/instructionContent.dart';
import 'package:MultitaskResearch/KEYS.dart';
import 'package:MultitaskResearch/instruction.dart';
import 'package:MultitaskResearch/login.dart';
import 'package:MultitaskResearch/test.dart';
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart' as Firebase;

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

const String HomeRoute = '/home';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: HomeRoute,
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
    case '/login':
      return MaterialPageRoute(
          builder: (_) => Login(
                id: routingData._queryParameters["id"],
              ));
    case '/instruction':
      return MaterialPageRoute(
          builder: (_) => Instruction(
                id: routingData._queryParameters["id"],
              ));
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// String getId(String url) {
//   Map<String, String> params = new HashMap<String, String>();
//   url.replaceFirst("?", "").split("&").forEach((e) {
//     if (e.contains("=")) {
//       List<String> split = e.split("=");
//       params[split[0]] = split[1];
//     }
//   });

//   return params["RID"];
// }

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Instruction(isInstruction: true)
      // body: Test(
      //   isUnscored: false,
      //   id: "test",
      // ),
      body: Login(),
      // body: TestPage(
      //   title: "Instruction",
      //   totalLevel: 20,
      //   // content: Content(),
      //   content: InstructionContent(
      //     levelsLeft: 9,
      //     buttonClick: (res) {
      //       print(res);
      //     },
      //   ),
      // ),
    );
  }
}
