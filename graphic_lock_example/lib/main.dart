import 'dart:math';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

Map<int, Offset> coordinateData = {};

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color nodeColor1 = Colors.white;
  Color nodeColor2 = Colors.white;
  Color nodeColor3 = Colors.white;
  Color nodeColor4 = Colors.white;
  Color nodeColor5 = Colors.white;
  Color nodeColor6 = Colors.white;
  Color nodeColor7 = Colors.white;
  Color nodeColor8 = Colors.white;
  Color nodeColor9 = Colors.white;
  var dx;
  var dy;

  void isPointInside(Offset point, double radius) {
    coordinateData.forEach((key, value) {
      var distance =
          sqrt(pow(value.dx - point.dx, 2) + pow((value.dy - point.dy), 2));
      //return distance <= radius;

      if (distance <= radius) {
        if (key == 1) {
          setState(() {
            nodeColor1 = Colors.yellow;
          });
        }

        if (key == 2) {
          setState(() {
            nodeColor2 = Colors.yellow;
          });
        }

        if (key == 3) {
          setState(() {
            nodeColor3 = Colors.yellow;
          });
        }

        if (key == 4) {
          setState(() {
            nodeColor4 = Colors.yellow;
          });
        }

        if (key == 5) {
          setState(() {
            nodeColor5 = Colors.yellow;
          });
        }

        if (key == 6) {
          setState(() {
            nodeColor6 = Colors.yellow;
          });
        }

        if (key == 7) {
          setState(() {
            nodeColor7 = Colors.yellow;
          });
        }

        if (key == 8) {
          setState(() {
            nodeColor8 = Colors.yellow;
          });
        }

        if (key == 9) {
          setState(() {
            nodeColor9 = Colors.yellow;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Graphic Lock'),
        ),
        body: Center(
          child: new SizedBox(
            width: screenWidth * 0.8,
            height: screenWidth * 0.8,
            child: new Container(
                color: Colors.redAccent,
                child: GestureDetector(
                  onPanDown: (DragDownDetails detail) {
                    print('down $detail');
                    dx = detail.globalPosition.dx;
                    dy = detail.globalPosition.dy;
                  },
                  onPanUpdate: (DragUpdateDetails detail) {
                    print(
                        'update dx: ${dx += detail.delta.dx}, dy: ${dy += detail.delta.dy}');
                    isPointInside(Offset(dx, dy), screenWidth * 0.07 / 2);
                    // var test = isPointInside(
                    //     Offset(dx, dy), screenWidth * 0.07 / 2);
                    // print(test);
                  },
                  onPanEnd: (DragEndDetails detail) {
                    print('end $detail');
                  },
                  onPanCancel: () {
                    print('canceled');
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.05, bottom: screenWidth * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              right: screenWidth * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ConnectionNode(
                                nodeIndex: 1,
                                coordinateData: coordinateData,
                                widgetColor: nodeColor1,
                              ),
                              ConnectionNode(
                                nodeIndex: 2,
                                coordinateData: coordinateData,
                                widgetColor: nodeColor2,
                              ),
                              ConnectionNode(
                                nodeIndex: 3,
                                coordinateData: coordinateData,
                                widgetColor: nodeColor3,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              right: screenWidth * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ConnectionNode(
                                nodeIndex: 4,
                                coordinateData: coordinateData,
                                widgetColor: nodeColor4,
                              ),
                              ConnectionNode(
                                nodeIndex: 5,
                                coordinateData: coordinateData,
                                widgetColor: nodeColor5,
                              ),
                              ConnectionNode(
                                nodeIndex: 6,
                                coordinateData: coordinateData,
                                widgetColor: nodeColor6,
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              right: screenWidth * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              ConnectionNode(
                                nodeIndex: 7,
                                coordinateData: coordinateData,
                                widgetColor: nodeColor7,
                              ),
                              ConnectionNode(
                                nodeIndex: 8,
                                coordinateData: coordinateData,
                                widgetColor: nodeColor8,
                              ),
                              ConnectionNode(
                                nodeIndex: 9,
                                coordinateData: coordinateData,
                                widgetColor: nodeColor9,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }
}

class ConnectionNode extends StatefulWidget {
  final int nodeIndex;
  final Color widgetColor;
  final Map<int, dynamic> coordinateData;
  ConnectionNode({this.nodeIndex, this.coordinateData, this.widgetColor});
  @override
  _ConnectionNodeState createState() => _ConnectionNodeState();
}

class _ConnectionNodeState extends State<ConnectionNode> with AfterLayoutMixin {
  var baseX;
  var baseY;
  Color widgetColor = Colors.white;
  GlobalKey _positionKey = GlobalKey();
  _getPositions() {
    final screenWidth = MediaQuery.of(context).size.width;
    final RenderBox renderBox = _positionKey.currentContext.findRenderObject();
    final positionRed = renderBox.localToGlobal(Offset.zero);
    baseX = positionRed.dx + screenWidth * 0.07 / 2;
    baseY = positionRed.dy + screenWidth * 0.07 / 2;
    coordinateData[widget.nodeIndex] = Offset(baseX, baseY);
    print(
        "POSITION of Red: dx: ${positionRed.dx + screenWidth * 0.07 / 2}, dy: ${positionRed.dy + screenWidth * 0.07 / 2}");
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _getPositions();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return ClipOval(
      key: _positionKey,
      child: new SizedBox(
        width: screenWidth * 0.07,
        height: screenWidth * 0.07,
        child: Container(
          color: widget.widgetColor,
        ),
      ),
    );
  }
}
