import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Activity/Answer_Button.dart';
import 'package:quiz/Data/Questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex=0;
  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex=currentQuestionIndex+1; To Add the Questions (1 Method)
    // currentQuestionIndex +=1; To Add the Questions (2 Method)
    setState(() {
      currentQuestionIndex++;
    });   // this is the same as (3 Method)
  }
  @override
  Widget build(BuildContext context) {
    final currentQuestion=question[currentQuestionIndex];
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(currentQuestion.text,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              ...currentQuestion.getShuffledAnswers().map((answer){
                return AnswerButton(
                  answerText: answer,
                  onTap: (){
                    answerQuestion(answer);
                  },
                );
              }),

              // This can also be used (Diffrent method)
              // AnswerButton(
              //   onTap: (){},
              //   answerText: currentQuestion.answers[0],
              // ),
              // AnswerButton(
              //   onTap: (){},
              //   answerText: currentQuestion.answers[1],
              // ),
              // AnswerButton(
              //   onTap: (){},
              //   answerText: currentQuestion.answers[2],
              // ),
              // AnswerButton(
              //   onTap: (){},
              //   answerText: currentQuestion.answers[3],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

