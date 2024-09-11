import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, this.answerText, this.onTap});

  final String? answerText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
               backgroundColor: Color.fromARGB(255, 33, 1, 95),
          foregroundColor: Colors.white,
        ),
        child: Text(answerText!,textAlign: TextAlign.center,)
    );
  }
}
