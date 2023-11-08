List<String> parseQuestions(List<String> questionOptions) {
  List<String> optionList = [];
  for (var i = 0; i < questionOptions.length; i++) {
    if (questionOptions[i].isNotEmpty) {
      optionList.add(questionOptions[i]);
    }
  }
  return optionList;
}
