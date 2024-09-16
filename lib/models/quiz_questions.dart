class QuizQuestions {
  const QuizQuestions(this.question, this.options);

  final String question;
  final List<String> options;

  List<String> getShuffledOptions() {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
