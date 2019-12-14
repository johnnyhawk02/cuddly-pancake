import '../imagePaths.dart' show imagePaths;
import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';

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
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Image.asset(
            'assets/images/symbols/' + imagePaths[_imageList[1]],
            fit: BoxFit.contain,
            height: 400,
          ),
           Row(
            children:  List<Widget>.generate(7, (index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    Image.asset(
                      'assets/images/symbols/' + imagePaths[_imageList[index]],
                      fit: BoxFit.contain,
                      height: 120,
                    ),
                    Text(
                      _imageList[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
