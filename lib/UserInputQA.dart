import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfirst/score.dart';
import 'displayUserQuestions.dart';
import 'score.dart' as globals;
import 'questions.dart';

class UserInputAQ extends StatefulWidget {
  @override
  _UserInputAQState createState() => _UserInputAQState();
}

class _UserInputAQState extends State<UserInputAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('QUIZZY'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),

      body:
      Padding(
        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'What Question Do You Have In Mind??',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontFamily: 'BalsamiqSans',
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration.collapsed(hintText:
              'Upto 100 characters',
                  hintStyle: TextStyle(
                      color: Colors.white,
                  )
              ),
              style: TextStyle(
                color: Colors.amber
              ),
              onSubmitted: (String text){
                setState((){
                 globals.userQuestions.add(text);
                });
              },
            ),
            SizedBox(height: 50,),
            Text(
              'Answer For Your Question??',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontFamily: 'BalsamiqSans',
                color: Colors.amber,
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration.collapsed(hintText: 'YES OR NO IN CAPS ONLY',
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextStyle(
                color: Colors.amber,
              ),
              onSubmitted: (String text){
                setState((){
                  globals.userAnswers.add(text);
                });
              },

            ),
            RaisedButton(
              onPressed: (){
                globals.userIndexOfQuestion = globals.userIndexOfQuestion + 1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserInputAQ()),
                  );
              },
              textColor: Colors.grey[900],
              color:Colors.amber,
              child: Text('Enter Next Question'),
            ),
            RaisedButton(
              onPressed: (){
                globals.userIndexOfQuestion = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DisplayUserQuestions()),
                );
              },
              textColor: Colors.grey[900],
              color:Colors.amber,
              child: Text('Display Questions'),
            ),
            SizedBox(height: 20.0,),
            Text(
              'NOTE: CLICK THE TICK MARK IN YOUR KEYBOARD AFTER ENTERING QUESTION AND ANSWER',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                fontFamily: 'BalsamiqSans',
                color: Colors.red[200],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
