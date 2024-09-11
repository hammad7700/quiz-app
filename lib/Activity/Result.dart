import 'package:flutter/material.dart';
import 'package:quiz/Activity/question_summary.dart';

import '../Data/Questions.dart';

class Result_Screen extends StatelessWidget {
  const Result_Screen({super.key, required this.choosenAnswer, required this.onRestart});
  final List<String> choosenAnswer;
  final void Function() onRestart;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    // Loop over the length of the questions list
    for (var i = 0; i < question.length; i++) {
      summary.add({
        "question_index": i,
        "question": question[i].text,
        "correct_answer": question[i].answers[0],
        "user_answer": choosenAnswer[i],
      });
    }

    return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summaryData=getSummaryData();
    final numTotalQuestion=question.length;
    final numCorrectQuestion=summaryData.where((data){
      return data["user_answer"] == data["correct_answer"];
    }).length;
    return SizedBox(
      width: double.infinity,
      child:Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("You Answer $numCorrectQuestion out of $numTotalQuestion Question Correctly",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),),
            SizedBox(height: 40,),
            QuestionSummary(summaryData),
            SizedBox(height: 30,),
            TextButton.icon(
                onPressed: onRestart,
                icon: Icon(Icons.refresh,color: Colors.white,),
                label: Text("Restart Quiz ",style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),)),
          ],
        ),
      ),
    );
  }
}
