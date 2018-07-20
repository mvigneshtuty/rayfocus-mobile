import 'package:flutter/material.dart';

void main() => runApp(new FlutterLayoutApp());

class FlutterLayoutApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // Title Section In Body
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ]),
          ),
          FavouriteWidget()
        ],
      ),
    );

    // Util method to generate Button Colums
    Column generateButtonColumn(IconData icon, String label){
      Color color = Theme.of(context).primaryColor;
     return Column(
       mainAxisSize: MainAxisSize.min,
       mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon,color: color,),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                color: color
              ),
            ),
          )
        ],
      );
    }

    // Button Section of the Body Content
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          generateButtonColumn(Icons.call, "CALL"),
          generateButtonColumn(Icons.near_me, "ROUTE"),
          generateButtonColumn(Icons.share, "SHARE")
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    // This widget is the root of your application.
    return new MaterialApp(
      title: 'Flutter Layout Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Layout'),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/lake.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );


  }
}

class FavouriteWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new FavouriteWidgetState();
  }
}

class FavouriteWidgetState extends State{
  bool _isFavourite = true;
  int _favouriteCount = 41;

  @override
  Widget build(BuildContext context) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0.0),
            child: IconButton(
                icon: _isFavourite? Icon(Icons.star): Icon(Icons.star_border),
                onPressed: toggleFavourite,
                color: Colors.amber,
            ),
          ),
          SizedBox(
            width: 18.0,
            child: Container(
              child: Text(
                '$_favouriteCount'
              ),
            ),
          )
        ],
      );
  }

  void toggleFavourite(){
    setState(() {
      if(_isFavourite){
        _isFavourite = false;
        _favouriteCount -= 1;
      }
      else{
        _isFavourite = true;
        _favouriteCount += 1;
      }
    });
  }
}
