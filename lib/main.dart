import 'dart:async';
import 'package:MultitaskResearch/KEYS.dart';
import 'package:MultitaskResearch/instruction.dart';
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Instruction(isInstruction: true),
    );
  }
}
