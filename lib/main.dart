import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import "word_list.dart" show WordList;
import 'imagePaths.dart' show imagePaths;
//import 'package:webmakaton/image_and_text_01' show ImageAndText;
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
          FlatButton(
            textColor: Colors.white,
            onPressed: random,
            child: Text("Randomize"),
            //shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              new RaisedButton(
                onPressed: random,
                textColor: Colors.white,
                color: Colors.red,
                padding: const EdgeInsets.all(16.0),
                child: new Text(
                  "RANDOMIZE",
                ),
              ),
              ImageAndText(imageList: _imageList),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageAndText extends StatelessWidget {
  const ImageAndText({
    Key key,
    @required List<String> imageList,
  })  : _imageList = imageList,
        super(key: key);

  final List<String> _imageList;

  @override
  Widget build(BuildContext context) {
    return Expanded(

      //color: Colors.white,
      //height: 600,
      child: new GridView.count(

        childAspectRatio: 1.5,
        crossAxisCount: 4,
        children: new List<Widget>.generate(60, (index) {
          return Column(

            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/symbols/' +
                            imagePaths[_imageList[index]],
                        fit: BoxFit.contain,
                        height: 90,
                        width: 90,
                      ),
                      Image.asset(
                        'assets/images/signs/' + imagePaths[_imageList[index]],
                        fit: BoxFit.contain,
                        height: 180,
                        width: 180,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                _imageList[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
