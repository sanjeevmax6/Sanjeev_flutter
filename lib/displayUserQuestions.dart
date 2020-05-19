import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfirst/score.dart';
import 'score.dart' as globals;
import 'questions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayUserQuestions extends StatefulWidget {
  @override
  _DisplayUserQuestionsState createState() => _DisplayUserQuestionsState();
}

class _DisplayUserQuestionsState extends State<DisplayUserQuestions> {

  SharedPreferences prefs;

  initState(){
    super.initState();
    init();
  }

  void init () async{
    prefs = await SharedPreferences.getInstance();
    globals.userHighScore = (prefs.getInt('userScoreUp'));
    prefs.setInt('userScoreUp', globals.userHighScore);
    setState(() {
      globals.userHighScore;
    });


  }
  void userScoreUp() async{
    prefs = await SharedPreferences.getInstance();
    setState((){
      globals.userHighScore+=50;
    });
    prefs.setInt('userScoreUp', globals.userHighScore);
  }

  void setHighScore() async{
    prefs = await SharedPreferences.getInstance();
    globals.userHighScore = prefs.getInt('userScoreUp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          title: Text('QUIZZY'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          leading: GestureDetector(
            onTap: () {}
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  setHighScore();
                  Navigator.push(context, Score());
                },
                child: Icon(
                    Icons.arrow_right
                ),
              ),
            )

          ]),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
              width:  MediaQuery. of(context). size. width,
              child:
              LinearProgressIndicator(
                value: globals.userIndexOfQuestion/10 ,
                backgroundColor: Colors.grey[850],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                /*strokeWidth: 10,*/
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '${globals.userQuestions[questionIndex]}',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontFamily: 'BalsamiqSans',
                color: Colors.amber,
              ),
            ),
            RaisedButton(
              onPressed: () {
                if(globals.userAnswers[answerIndex] == 'YES' || globals.userAnswers[answerIndex] == 'yes' || globals.userAnswers[answerIndex] == 'Yes'){
                  globals.userScore+=50;
                  userScoreUp();
                }
              },
              textColor: Colors.grey[900],
              color: Colors.amber,
              child: Text('YES'),
            ),
            SizedBox(height: 20,),
            RaisedButton(
              onPressed: () {
                if(globals.userAnswers[answerIndex] == 'NO' || globals.userAnswers[answerIndex] == 'no' || globals.userAnswers[answerIndex] == 'No' || globals.userAnswers[answerIndex] == 'nO' ){
                  globals.userScore+=50;
                  userScoreUp();
                }
              },
              textColor: Colors.grey[900],
              color: globals.getColorChange() ? Colors.green: Colors.amber,
              child: Text('NO'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
            Icons.navigate_next
        ),
        label: Text(
          'NEXT QUESTION',
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontFamily: 'BalsamiqSans',
            color: Colors.grey[850],
            backgroundColor: Colors.amber,
          ),),
        onPressed: () {
          setState(() {
            if(globals.userIndexOfQuestion <= 10){
            globals.userIndexOfQuestion+=1;
            globals.questionIndex+=1;
            globals.answerIndex+=1;
            }
            else if(globals.userIndexOfQuestion == 10){
              Navigator.push(context, Score());
            }
           });
        },
      ),


    );
  }
}

class Score extends MaterialPageRoute<Null>{
  Score() : super(builder: (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('SCORE BOARD'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body:Padding(
        padding:EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30.0,),
            SizedBox(
              height: 100.0,
              width:  MediaQuery. of(context). size. width,
              child:
              CircularProgressIndicator(
                value: (globals.userScore/500),
                backgroundColor: Colors.grey[850],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                strokeWidth: 10,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${globals.userScore}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontFamily: 'BalsamiqSans',
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 10.0,),
            Text(
              '${globals.userHighScore}',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontFamily: 'BalsamiqSans',
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 10.0,),
            RaisedButton.icon(
              onPressed: () async{
                SharedPreferences preferences = await SharedPreferences.getInstance();
                await preferences.setInt('userScoreUp',0);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              label: Text('RESET HIGHSCORE',
                style: TextStyle(color: Colors.white),),
              icon: Icon(Icons.clear, color:Colors.red[500],),
              textColor: Colors.grey[900],
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  });
}

