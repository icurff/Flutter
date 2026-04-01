class Question {
  final String question;
  final bool ans;

  Question(this.question, this.ans);
}

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question(
      'Khoảng một phần tư số xương trong cơ thể người nằm ở bàn chân.',
      true,
    ),
    Question('Máu của ốc sên có màu xanh lá.', true),
    Question('Bầu trời có màu xanh lá.', false),
    Question('Flutter được phát triển bởi Google.', true),
  ];

  String getQuestionText() {
    return _questionBank[_questionNumber].question;
  }

  bool getAns() {
    return _questionBank[_questionNumber].ans;
  }

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    return _questionNumber >= _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }

  int get totalQuestions => _questionBank.length;
}
