
class Question{
  final String questionText;
  final List<Answer> answerList;

  Question(this.questionText, this.answerList);
}

class Answer{
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions(){
  List<Question> list = [];


  list.add(
    Question("Who the founder of Apple?",
    [
      Answer("Steve Jobs", true),
      Answer("Jeff Bezos", false),
      Answer("Hillary Cilton", false),
      Answer("Brack Obama", false)
      ],
    )
  );

  list.add(
    Question("What is flutter?",
    [
      Answer("Android Development tool", false),
      Answer("Cross-Platform", true),
      ],
    )
  );
  
  list.add(
    Question("Who is the 1st president of Nepal?",
    [
      Answer("Dr. Rambaran Yadav", true),
      Answer("Bidya Devi Bhandari", false),
      ],
    )
  );

  return list;
}