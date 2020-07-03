import 'package:flutter/material.dart';

class CorrectWrongAnimation extends StatefulWidget {
  
  final bool _isCorrect;
  final VoidCallback _onTap;

  CorrectWrongAnimation(this._isCorrect, this._onTap);
  
  @override
  State createState() => new CorrectWrongAnimationState();
}

class CorrectWrongAnimationState extends State<CorrectWrongAnimation> {
  
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                color: Colors.blueGrey,
                shape: BoxShape.circle
              ),
              child: new Icon(widget._isCorrect == true ? Icons.done : Icons.clear, size: 80, color: Colors.white,),
            ),
            new Text(widget._isCorrect == true ? "Well done!" : "Wrong answer!", style: new TextStyle(fontSize: 25.0, color: Colors.white),)
          ],
        )
      )
    );
  }
}