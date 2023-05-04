class QuizQuestion {
  QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffel = List.of(answers);
    shuffel.shuffle();
    return shuffel;
  }
}
