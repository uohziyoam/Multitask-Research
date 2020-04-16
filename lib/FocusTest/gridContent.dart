import 'package:MultitaskResearch/FocusTest/constants.dart';
import 'package:MultitaskResearch/FocusTest/square.dart';
import 'package:flutter/widgets.dart';

class Content extends StatefulWidget {
  Content({Key key}) : super(key: key);

  @override
  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  Widget gridGenerator() {
    List<List<int>> sample = [
      [45, 90, 135],
      [90, 0, 0],
      [35, 0, 0],
    ];

    List<Widget> row = [];

    for (var i = 0; i < 3; i++) {
      List<Widget> subRow = [];
      for (var j = 0; j < 3; j++) {
        subRow.add(
          Square(
              leftPadding: 5,
              rightPadding: 5,
              borderColor: BLUE_COLOR_BORDER,
              backgroundColor: BLUE_COLOR_BACKGROUND,
              degree: sample[i][j] * 1.0),
        );
      }
      row.add(Padding(
          padding: EdgeInsets.only(top: 130), child: Row(children: subRow)));
    }

    return Column(children: row);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: gridGenerator());
  }
}
