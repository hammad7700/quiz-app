import 'package:flutter/material.dart';
import 'package:quiz/Activity/Question.dart';
import 'package:quiz/Activity/Result.dart';
import 'package:quiz/Data/Questions.dart';
import 'Start_Screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}
class _QuizState extends State<Quiz> {
   List<String> selectedAnswers=[];
  var activeScreen ="Start-Screen";
  @override

  void switchScreen(){
    setState(() {
      activeScreen="QuestionScreen";
    });
  }
  void chooseAnswers(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == question.length){
      setState(() {
        activeScreen="Result-Screen";
      });
    }
  }
  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen="question-Screen";
    });
  }
  @override
  Widget build(BuildContext context) {
    var screenWidget = activeScreen ==
    "Start-Screen"? StartScreen(switchScreen):QuestionScreen(onSelectAnswer: chooseAnswers,);
    if(activeScreen == "Result-Screen"){
      screenWidget = Result_Screen(choosenAnswer: selectedAnswers, onRestart: restartQuiz,);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:[
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ]),
            ),
            child: screenWidget,
        ),
      ),
    );
  }
}
