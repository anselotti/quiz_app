import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('question'),
          const SizedBox(height: 30),
          AnswerButton(
            text: 'answer 1',
            onTap: () {},
          ),
          AnswerButton(
            text: 'answer 2',
            onTap: () {},
          ),
          AnswerButton(
            text: 'answer 3',
            onTap: () {},
          ),
          AnswerButton(
            text: 'answer 4',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
