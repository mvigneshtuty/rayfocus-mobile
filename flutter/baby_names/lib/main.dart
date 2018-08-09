import 'package:flutter/material.dart';

void main() => runApp(new BabyNamesApp());

class BabyNamesApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Baby Names Poll',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Baby Names'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Yet Another Flutter App')
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
