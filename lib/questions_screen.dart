import 'package:flutter/material.dart';
import 'package:quiz/option_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answeredQuestion(String selectedAnswer) {
    widget.onSelectAnswer(
        selectedAnswer); // widget. is used as onSelectAnswer is being refered from another file
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledOptions().map((answer) {
              // Above the list of shuffled options is converted to the list of Widgets,
              // then using the ... operator, each widget is pulled out of the list.
              return OptionButton(
                answer,
                () {
                  answeredQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
