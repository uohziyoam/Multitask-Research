import 'package:MultitaskResearch/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginState();
}

// Used for controlling whether the user is loggin or creating an account
enum FormType { login, register }

class _LoginState extends State<Login> {
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

  _LoginState() {
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
      body: new Container(
        padding: EdgeInsets.only(left: 450, right: 450),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFields() {
    return new Container(
      padding: EdgeInsets.only(top: 300 * heightRatio),
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
            minWidth: widthRatio * 80,
            height: 35,
            disabledColor: Color.fromARGB(255, 255, 0, 1),
            child: RaisedButton(
              child: new Text('Go!'),
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
              builder: (context) => Test(
                    isUnscored: false,
                    id: _id,
                  )));
    }
  }
}
