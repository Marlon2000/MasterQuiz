import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

import './quiz_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Vibration.vibrate(duration: 2000);
    return new Material(
      color: Colors.lightBlueAccent,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Spacer(),
            new Text("Big Master Quiz", style: new TextStyle(color: Colors.white, fontSize: 50.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),),
            Image.asset('assets/image/question.png'),
            new Spacer(),
            new Text("Tap to get started!", style: new TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}