import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_animation.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("The Xbox Series X has 10 Teraflops", false),
    new Question("Cyberpunk 2077 will be released this year", true),
    new Question("The PS5 Pro has a ssd with 5.5 GB/s", true),
    new Question("Detroit: Become Human has RTX support", false),
    new Question("PC-Hardware is getting more expensive", false)
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;

  bool animationVisible = false;


  @override
  void initState(){
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

    void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      animationVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column( // Represents the main page
          children: <Widget>[
            new QuestionText(questionText, questionNumber),
            new AnswerButton(true, () => handleAnswer(true)),
            new AnswerButton(false, () => handleAnswer(false))
          ],
        ),
        animationVisible == true ? new CorrectWrongAnimation(isCorrect, () {
          currentQuestion = quiz.nextQuestion;
          this.setState(() {
            animationVisible = false;
            questionText = currentQuestion.question;
            questionNumber = quiz.questionNumber;
          });
        }) : new Container()
      ],
    );
  }
}