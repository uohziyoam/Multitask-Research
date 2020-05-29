import 'package:flutter/widgets.dart';

class Button extends StatefulWidget {
  final int currentLevel;
  final Function(int cur) changeLevel;

  Button({Key key, this.currentLevel, this.changeLevel}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  int currentLevel = 1;
  var widthRatio, heightRatio;
  Color iconColorRight = Color.fromARGB(255, 112, 112, 112);
  Color iconColorLeft = Color.fromARGB(255, 112, 112, 112);
  @override
  void initState() {
    super.initState();
    currentLevel = widget.currentLevel;
  }

  @override
  Widget build(BuildContext context) {
    widthRatio = MediaQuery.of(context).size.width / 768;
    heightRatio = MediaQuery.of(context).size.height / 1024;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MouseRegion(
          onEnter: (event) => setState(() {
            iconColorLeft = Color.fromARGB(255, 5, 5, 5);
          }),
          onExit: (event) => setState(() {
            iconColorLeft = Color.fromARGB(255, 112, 112, 112);
          }),
          child: GestureDetector(
              onTap: currentLevel == 1
                  ? null
                  : () {
                      setState(() {
                        if (currentLevel == 1) {
                        } else if (currentLevel == 2) {
                          currentLevel -= 1;
                        } else if (currentLevel == 3) {
                          currentLevel -= 1;
                        }
                        widget.changeLevel(currentLevel);
                      });
                      print(currentLevel);
                    },
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 153, 153, 153)),
                    borderRadius: BorderRadius.circular(1.0),
                    color: currentLevel == 1
                        ? Color.fromARGB(255, 237, 237, 237)
                        : Color.fromARGB(255, 255, 255, 255)),
                width: 135,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      IconData(58846,
                          fontFamily: 'MaterialIcons',
                          matchTextDirection: true),
                      size: 25,
                      color: currentLevel == 1
                          ? Color.fromARGB(255, 112, 112, 112)
                          : iconColorLeft,
                    ),
                    Text('Previous',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: currentLevel == 1
                                ? Color.fromARGB(255, 119, 152, 178)
                                : Color.fromARGB(255, 24, 84, 131))),
                    Padding(
                      padding: EdgeInsets.only(right: 00),
                    ),
                  ],
                ),
              )),
        ),
        Padding(
            padding: EdgeInsets.only(left: widthRatio * 20),
            child: MouseRegion(
                onEnter: (event) => setState(() {
                      iconColorRight = Color.fromARGB(255, 5, 5, 5);
                    }),
                onExit: (event) => setState(() {
                      iconColorRight = Color.fromARGB(255, 112, 112, 112);
                    }),
                child: GestureDetector(
                    onTap: currentLevel == 3
                        ? null
                        : () {
                            setState(() {
                              if (currentLevel == 1) {
                                currentLevel += 1;
                              } else if (currentLevel == 2) {
                                currentLevel += 1;
                              } else if (currentLevel == 3) {}
                              widget.changeLevel(currentLevel);
                            });
                          },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 153, 153, 153)),
                          borderRadius: BorderRadius.circular(1.0),
                          color: currentLevel == 3
                              ? Color.fromARGB(255, 237, 237, 237)
                              : Color.fromARGB(255, 255, 255, 255),
                        ),
                        width: 135,
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 00),
                            ),
                            Text('Next',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: currentLevel == 3
                                      ? Color.fromARGB(255, 119, 152, 178)
                                      : Color.fromARGB(255, 24, 84, 131),
                                )),
                            Icon(
                              IconData(58847,
                                  fontFamily: 'MaterialIcons',
                                  matchTextDirection: true),
                              size: 25,
                              color: currentLevel == 3
                                  ? Color.fromARGB(255, 112, 112, 112)
                                  : iconColorRight,
                            )
                          ],
                        )))))
      ],
    );
  }
}
