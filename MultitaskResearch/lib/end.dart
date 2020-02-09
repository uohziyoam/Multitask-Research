import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class End extends StatefulWidget {
  End({Key key}) : super(key: key);

  @override
  _EndState createState() => _EndState();
}

class _EndState extends State<End> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                "Thank you for your participation!",
                style: TextStyle(fontSize: 35),
              )
            ])
          ]),
    );
  }
}
