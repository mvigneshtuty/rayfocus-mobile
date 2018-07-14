import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(StartupNameGenApp());

class StartupNameGenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  //  final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Startup NameGen',
      home: RandomWords(),
      theme: ThemeData(
        primaryColor: Colors.indigo,
        splashColor: Colors.pink,
        dividerColor: Colors.purple[200],
        iconTheme: IconThemeData(
          color: Colors.pink
        )
      ),
    );
  }
}

// Stateful Widget Class
class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

// State class
class RandomWordsState extends State<RandomWords>{
  final _suggestions = <WordPair>[];
  final _favouriteNames = Set<WordPair>();
  final _biggerFont  = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return new ListView.builder(itemBuilder: (context, i){
      if(i.isOdd){
        return new Divider();
      }

      final index = i~/2;
      if(index >= _suggestions.length){
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    }
    );
  }

  Widget _buildRow(WordPair wp){
    final _isAlreadySavedName = _favouriteNames.contains(wp);
    return ListTile(
      title: Text(
         wp.asPascalCase,
         style: _biggerFont,
      ),
      trailing: Icon(
          _isAlreadySavedName ? Icons.favorite : Icons.favorite_border,
          color: _isAlreadySavedName ? Colors.pink[500] : null,
      ),
      onTap: (){
        setState(() {
          _isAlreadySavedName ? _favouriteNames.remove(wp) : _favouriteNames.add(wp);
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        final favNameItem = _favouriteNames.map(
            (favName){
              return ListTile(
                title: Text(
                  favName.asPascalCase,
                  style: _biggerFont,
                ),
              );
            }
        );
        final favNameItemList = ListTile.divideTiles(
            context: context,
            tiles: favNameItem
        ).toList();

        return Scaffold(
          appBar: AppBar(
            title: Text('Favourite Names'),
          ),
          body: ListView(children: favNameItemList,),
        );
      })
    );
  }
}