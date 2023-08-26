import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final void Function() restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  build(BuildContext context) {
    final summaryData = getSummaryData();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numberOfCorrectAnswers out of $numberOfTotalQuestions questions correctly!',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 215, 247, 247),
              ),
            ),
            if (numberOfCorrectAnswers == numberOfTotalQuestions)
              const Text(
                  'Perfect! You could get a contract to Saudi Pro League!'),
            if (numberOfCorrectAnswers < numberOfTotalQuestions &&
                numberOfCorrectAnswers >= 5)
              const Text(
                  'Well done! You know more about football than Jose Mourinho!'),
            if (numberOfCorrectAnswers < 5 && numberOfCorrectAnswers >= 3)
              const Text('You follow more ice kendo?'),
            if (numberOfCorrectAnswers < 3 && numberOfCorrectAnswers >= 1)
              const Text(
                  'Ok you might have done something else than watch football and drink beer?'),
            if (numberOfCorrectAnswers == 0)
              const Text('You couldn\'t get a contract even to Veikkausliiga!'),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            SizedBox(
              width: 200,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(10),
                  side: const BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: restartQuiz,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 24,
                ),
                label: Text(
                  'Restart Quiz',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
