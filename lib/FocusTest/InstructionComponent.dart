import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InstructionComponent extends StatefulWidget {
  final Widget upperContent;
  final String instruction;
  final int currentStep;

  InstructionComponent(
      {Key key, this.upperContent, this.instruction, this.currentStep})
      : super(key: key);

  @override
  _InstructionComponentState createState() => _InstructionComponentState();
}

class _InstructionComponentState extends State<InstructionComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: 655,
      child: Column(
        children: <Widget>[
          widget.upperContent,
          Padding(
            padding: EdgeInsets.only(top: 75),
          ),
          Container(
            width: 450,
            height: 100,
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.topCenter,
            child: Text(
              widget.instruction,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
