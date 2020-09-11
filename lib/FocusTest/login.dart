import 'dart:html';

import 'package:MultitaskResearch/FocusTest/InstructionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestFocusLogin extends StatefulWidget {
  final String id;

  TestFocusLogin({Key key, this.id}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _MultiTaskLoginState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType { login, register }

class _MultiTaskLoginState extends State<TestFocusLogin> {
  var widthRatio;
  var heightRatio;
  final TextEditingController _idFilter = new TextEditingController();
  String _id = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _idFilter.dispose();
    super.dispose();
  }

  _MultiTaskLoginState() {
    _idFilter.addListener(_idListen);
  }

  void _idListen() {
    if (_idFilter.text.isEmpty) {
      _id = "";
    } else {
      _id = _idFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    widthRatio = MediaQuery.of(context).size.width / 768;
    heightRatio = MediaQuery.of(context).size.height / 1024;
    return new Scaffold(
      body: new Row(mainAxisAlignment: MainAxisAlignment.center,
          // padding: EdgeInsets.only(left: 450, right: 450),
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildTextFields(),
                _buildButtons(),
              ],
            ),
          ]),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      padding: EdgeInsets.only(top: 300 * heightRatio),
      width: 300,
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextField(
              autofocus: true,
              controller: _idFilter,
              decoration: new InputDecoration(labelText: 'ID'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return new Container(
      padding: EdgeInsets.only(top: 30),
      child: new Column(
        children: <Widget>[
          ButtonTheme(
            minWidth: 120,
            height: 35,
            disabledColor: Color.fromARGB(255, 255, 0, 1),
            child: RaisedButton(
              child: new Text('Go!',
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              onPressed: _loginPressed,
            ),
          )
        ],
      ),
    );
  }

  // These functions can self contain any user auth logic required, they all have access to _email and _password

  void _loginPressed() {
    print('The user wants to login with $_id');

    if (_id.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InstructionPage(
            id: _id,
            title: "Test",
            totalLevel: 3,
            content: Container(),
          ),
        ),
      );
    }
  }
}
