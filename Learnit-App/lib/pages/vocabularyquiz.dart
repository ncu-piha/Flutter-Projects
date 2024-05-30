import 'package:flutter/material.dart';
import 'package:learnit/utility/vocabularyprovider.dart';

import 'package:provider/provider.dart';
//import 'package:learnit/providers/vocabulary_provider.dart';

class VocabularyQuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vocabulary Quiz'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Consumer<VocabularyProvider>(
        builder: (context, quizProvider, child) {
          final question = quizProvider.questions[quizProvider.currentQuestionIndex];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${quizProvider.currentQuestionIndex + 1}: ${question.questionText}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
                SizedBox(height: 20),
                ...question.options.asMap().entries.map((entry) {
                  final index = entry.key;
                  final option = entry.value;
                  return _buildOptionCard(option, () {
                    quizProvider.answerQuestion(index);
                  });
                }).toList(),
                Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      quizProvider.answerQuestion(-1);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Next Question', style: TextStyle(fontSize: 18)),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Score: ${quizProvider.score}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOptionCard(String option, VoidCallback onTap) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            option,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}