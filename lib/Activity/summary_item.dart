import 'package:flutter/material.dart';
import 'package:quiz/Activity/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({super.key, required this.itemData});

  final Map<String, Object> itemData; // Changed from List<Map> to Map

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData["user_answer"] == itemData["correct_answer"];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Aligns items vertically at the start
      children: [
        // Custom widget for displaying question identifier
        QuestionIdentifier(
          questionIndex: itemData["question_index"] as int,
          isCorrectAnswer: isCorrectAnswer,
        ),
        const SizedBox(width: 30), // Spacing between the identifier and the text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns texts to the start
            children: [
              Text(
                itemData["question"].toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Your Answer: ${itemData["user_answer"]}',
                style: TextStyle(color: isCorrectAnswer ? Colors.green : Colors.red),
              ),
              Text(
                'Correct Answer: ${itemData["correct_answer"]}',
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
