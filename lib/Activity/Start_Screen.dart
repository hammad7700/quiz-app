import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_animation_transition/animations/top_to_bottom_faded.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:quiz/Activity/Question.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function()? startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 60,),
          Image.asset("assets/images/logos.png", width: 320,),
          SizedBox(height: 30,),
          Text(
            "Learn Flutter The Fun Way!",
            style: GoogleFonts.oswald(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: OutlinedButton.icon(
                onPressed: startQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white
                ),
                icon: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,),
                label: Text("Start Quiz",)),
          ),
        ],
      ),
    );
  }
}

