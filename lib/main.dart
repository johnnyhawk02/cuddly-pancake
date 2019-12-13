import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import "word_list.dart" show WordList;
import 'imagePaths.dart' show imagePaths;
import 'package:webmakaton/widgets/image_and_text_01.dart' show ImageAndText;
//void main(){
//  WordList.randomList(100).forEach(
//          (word){
//    print (word);3
//  },
//});

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _imageList = WordList.randomList(100);

  void random() {
    setState(() {
      _imageList = WordList.randomList(100);
      print(_imageList[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Makaton'),
        actions: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                textColor: Colors.white,
                onPressed: random,
                child: Text("Randomize"),
              ),
              FlatButton(
                textColor: Colors.white,
                onPressed: random,
                child: Text("Randomize"),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
//              new RaisedButton(
//                onPressed: random,
//                textColor: Colors.white,
//                color: Colors.red,
//                padding: const EdgeInsets.all(16.0),
//                child: new Text(
//                  "RANDOMIZE",
//                ),
//              ),
              ImageAndText(imageList: _imageList),
            ],
          ),
        ),
      ),
    );
  }
}

