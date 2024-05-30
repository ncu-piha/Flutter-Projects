import 'package:flutter/foundation.dart';
import 'package:learnit/utility/question.dart';

class VocabularyProvider with ChangeNotifier {
  final List<Question> _questions = [
    Question(
      questionText:
          'Choose the word that is most nearly similar in meaning to the word in capital letters.: 1) BESEECH',
      options: [
        'Starving',
        'Implore',
        'weak',
        'Highly skilled',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      questionText: '2) RAVENOUS',
      options: [
        'Starving',
        'Voracious',
        'Easily broken ',
        'Highly skilled',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: '3) INTEREST : USURY ',
      options: [
        'frugal : fragile',
        'enmity : friend',
        'sand : dune',
        'frugality : parsimony',
      ],
      correctOptionIndex: 3,
    ),
    Question(
      questionText:
          ' 4) Kindly ask him to play the piano, he is a ____ pianist. ',
      options: [
        'fragile',
        'virtuoso',
        'voracious',
        ' vulnerable',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      questionText: '5) Please be careful, the luggage contains ____ items.',
      options: [
        'fragile',
        'virtuoso',
        'voracious',
        'vulnerable',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: '6? Due to gas leakage, all people especially children are',
      options: [
        'fragile',
        'virtuoso',
        'voracious',
        'vulnerable',
      ],
      correctOptionIndex: 2,
    ),
    Question(
      questionText: ' 7) He is a ____ person, he eats all the time.',
      options: [
        'skilled',
        'voracious',
        'slanderous',
        'biased',
      ],
      correctOptionIndex: 1,
    ),
    Question(
      questionText:
          ' 8) Nowadays ____ attacks are common in the politics, and people do not bother to tell lie.',
      options: [
        'skilled',
        'voracious',
        'slanderous',
        'biased',
      ],
      correctOptionIndex: 2,
    ),
    Question(
      questionText:
          'Choose the word that is most nearly opposite: 9) CACOPHONY',
      options: [
        'euphony',
        'cadaver',
        'hatred',
        'voracious',
      ],
      correctOptionIndex: 0,
    ),
    Question(
      questionText: ' 10) ENMITY',
      options: [
        'euphony',
        'cadaver',
        'hatred',
        'friendship',
      ],
      correctOptionIndex: 3,
    )
    // Add more questions here...
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  List<Question> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;

  void answerQuestion(int selectedOptionIndex) {
    if (_questions[_currentQuestionIndex].correctOptionIndex ==
        selectedOptionIndex) {
      _score += 10;
    }
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
    } else {
      _currentQuestionIndex = 0; // Reset to first question
      _score = 0; // Reset score
    }
    notifyListeners();
  }
}