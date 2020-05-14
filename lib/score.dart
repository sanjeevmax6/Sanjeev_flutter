library my_prj.globals;
import 'questions.dart';
import 'package:shared_preferences/shared_preferences.dart';

int score = 0;
int userScore = 0;
bool colorChange = false;

int highScore = 0;
int userHighScore = 0;

int numberOfRounds = 0;
int userIndexOfQuestion = 0;

List <String> userQuestions =['Is Nairobi the capital of Kenya'];
List<String> userAnswers = ['YES'];

int questionIndex = 0;
int answerIndex = 0;

setColorFalse(){
   colorChange =false;
}
setColorTrue(){
   colorChange = true;
}
getColorChange(){
   return colorChange;
}

