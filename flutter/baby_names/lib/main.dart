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
      home: HomePage(appTitle : 'Baby Names Poll'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget{

  HomePage({
    this.appTitle
      });

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Yet Another Flutter App')
          ],
        ),
      ),
    );
  }

}
