import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfirst/UserInputQA.dart';
import 'displayUserQuestions.dart';
import 'score.dart' as globals;
import 'questions.dart';



class CreateOwnQuestion extends StatefulWidget {
  @override
  _CreateOwnQuestionState createState() => _CreateOwnQuestionState();





}

class _CreateOwnQuestionState extends State<CreateOwnQuestion> {
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
              'How Many Question Do you Have In Mind??',
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
              decoration: new InputDecoration(labelText: "Enter your number"),
              keyboardType: TextInputType.number,
              onSubmitted: (number){
                setState(() {
                  globals.numberOfRounds = number as int;
                });
                },
            ),
            RaisedButton(
              onPressed: (){
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserInputAQ()),
                  );
                });
              },
            ),



          ],
        ),
      ),

    );
  }
}
