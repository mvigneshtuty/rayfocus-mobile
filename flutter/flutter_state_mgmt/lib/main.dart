import 'package:flutter/material.dart';

void main() => runApp(new FlutterStateMgmtApp());

class FlutterStateMgmtApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter state Mgmt',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter States'),
        ),
        body: ListView(
          children: <Widget>[
            generateTapBoxWidgetSection(TapBoxAwidget(),"Widget manages it's own state"),
            Divider(),
            generateTapBoxWidgetSection(ParentWidget(),"Parent Widget manages the state of child widget"),
            Divider(),
            generateTapBoxWidgetSection(TapBoxAwidget(),"Yet another Widget manages it's own state")
          ],
        )
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}


Widget generateTapBoxWidgetSection(Widget tapBoxWidget, String tapBoxLabel){
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                      tapBoxLabel
                  ),
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  alignment: Alignment(0.0, 0.0),
                ),
                tapBoxWidget
              ],
            ),
          )
        ],
      ),
    );
}

// TapBox A => the widget handles its own state
class TapBoxAwidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new TapBoxAwidgetState();
  }
}

class TapBoxAwidgetState extends State{
  bool boxAstate = false;
  void _handleOnTap(){
    setState(() {
      boxAstate = !boxAstate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleOnTap,
      child: Container(
        child: Center(
          child: Text(
              boxAstate ? 'Active' : 'InActive'
          ),
        ),
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: boxAstate ? Colors.green : Colors.grey
        ),
      ),
    );
  }
}

// TapBox B => the state is managed by parent widget
class TapBoxBwidget extends StatelessWidget{

  final bool boxBstate;
  final ValueChanged<bool> onTapBoxBstateChanged;

  TapBoxBwidget({this.boxBstate: false, @required this.onTapBoxBstateChanged});


  void _handleOnTap(){
    onTapBoxBstateChanged(!boxBstate);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleOnTap,
      child: Container(
        child: Center(
          child: Text(
              boxBstate ? 'Active' : 'InActive'
          ),
        ),
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
            color: boxBstate ? Colors.green : Colors.yellow
        ),
      ),
    );
  }
}

// Parent widget to control the TabBox B state
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxBwidget(
        boxBstate: _active,
        onTapBoxBstateChanged: _handleTapboxChanged,
      ),
    );
  }
}