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
            generateTapBoxWidgetSection(ParentBwidget(),"Parent widget manages the state of child widget"),
            Divider(),
            generateTapBoxWidgetSection(ParentCwidget(),"State managed by both parent and child widgets")
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
//*********************************************
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
          color: boxAstate ? Colors.green : Colors.grey[500]
        ),
      ),
    );
  }
}

// TapBox B => the state is managed by parent widget
//**************************************************

// Parent widget to control the TabBox B state
class ParentBwidget extends StatefulWidget {
  @override
  _ParentBwidgetState createState() => _ParentBwidgetState();
}

class _ParentBwidgetState extends State<ParentBwidget> {
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

// Child widget => TapBoxBwidget
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
            color: boxBstate ? Colors.green : Colors.grey[500]
        ),
      ),
    );
  }
}



// TapBox C => the state is managed by both parent and child widget
//*****************************************************************

class ParentCwidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ParentCwidgetState();
}

class ParentCwidgetState extends State<ParentCwidget>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxCwidget(
        boxCstate: _active,
        onTapBoxCstateChanged: _handleTapboxChanged,
      ),
    );
  }
}

// Child widget => TapBoxCwidget

class TapBoxCwidget extends StatefulWidget{

  bool boxCstate = false;
  final ValueChanged<bool> onTapBoxCstateChanged;

  TapBoxCwidget({
    this.boxCstate: false,
    @required this.onTapBoxCstateChanged
  });

  @override
  State<StatefulWidget> createState() => TapBoxCwidgetState();
}

// Child widget state => TapBoxCwidget state
class TapBoxCwidgetState extends State<TapBoxCwidget>{

  bool _highlightBorder = false;

  _handleTapDown(TapDownDetails details){
    setState(() {
      _highlightBorder = true;
    });
  }

  _handleTapUp(TapUpDetails details){
    setState(() {
      _highlightBorder = false;
    });
  }

  _handleTap(){
    widget.onTapBoxCstateChanged(!widget.boxCstate);
  }

  _handleTapCancel(){
    setState(() {
      _highlightBorder = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
              widget.boxCstate ? 'Active' : 'InActive'
          ),
        ),
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
            color: widget.boxCstate ? Colors.green : Colors.grey[500],
            border: _highlightBorder
                    ? Border.all( color: Colors.red, width: 10.0)
                    : null
        ),
      ),
    );
  }
}
