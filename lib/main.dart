import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirst/UserInput.dart';
import 'package:flutterfirst/UserInputQA.dart';
import 'package:flutterfirst/questions.dart';
import 'questions.dart';
import 'score.dart' as globals;
import 'UserInput.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*import 'package:flute_music_player/flute_music_player.dart';*/

void main() => runApp(MaterialApp(
  home :Quiz(),
));


class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();

}

class _QuizState extends State<Quiz> {
  /*var _music;
  @override
  void initState() async{
    super.initState();
    var music = await MusicFinder.allSongs();
    setState(() {
      _music = music;
    });

  }*/
  SharedPreferences prefs;

  initState(){
    super.initState();
    init();
  }

  void init () async{
    prefs = await SharedPreferences.getInstance();
    globals.highScore = (prefs.getInt('scoreUp'));
    prefs.setInt('scoreUp', globals.highScore);
    setState(() {
      globals.highScore;
    });


  }
  void scoreUp() async{
    prefs = await SharedPreferences.getInstance();
    setState((){
      globals.highScore+=50;
    });
    prefs.setInt('scoreUp', globals.highScore);
  }
  
  void setScore() async{
    prefs = await SharedPreferences.getInstance();
    globals.highScore = prefs.getInt('scoreUp');
  }

  List <SetOfQuestions> listOfQuestions = [
    SetOfQuestions('Are Piranhas a kind of "Pisces"', 'YES'),
    SetOfQuestions('Green forms on a mixture of "Blue and Yellow" or "Red and Blue". Yes and No respectively.', 'YES'),
    SetOfQuestions('Xylophone is not a musical instrument', 'NO'),
    SetOfQuestions('Is the day after christmas known as Boxing Day?', 'YES'),
    SetOfQuestions('Octopuses cannot change their colors', 'NO'),
    SetOfQuestions('Did World War Two end in the year 1945?', 'YES'),
    SetOfQuestions('Bats can fly in the dark because of Echolocation', 'YES'),
    SetOfQuestions('Is Teragraph the real term for "Lie Detector"', 'NO'),
    SetOfQuestions('Is echidna an insect that dwells underground', 'NO'),
    SetOfQuestions('Is Vatican City the smallest country in the world', 'YES'),
  ];

  int indexOfQuestion = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          title: Text('QUIZZY'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
          leading: GestureDetector(
            onTap: () {},
           
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  setScore();
                  Navigator.push(context, Score());
                },
                child: Icon(
                    Icons.arrow_right
                ),
              ),
            )

          ]),
      body:
      Padding(
        padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 30.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              SizedBox(
                height: 100.0,
                width:  MediaQuery. of(context). size. width,
                child:
                LinearProgressIndicator(
                  value: (indexOfQuestion/10),
                  backgroundColor: Colors.grey[850],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                  /*strokeWidth: 10,*/
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '${listOfQuestions[indexOfQuestion].question}',
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
                  if(listOfQuestions[indexOfQuestion].answer == 'YES'){
                    globals.score+=50;
                    scoreUp();
                  }
                  },
                textColor: Colors.grey[900],
                color: Colors.amber,
                child: Text('YES'),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () {
                  if(listOfQuestions[indexOfQuestion].answer == 'NO'){
                    globals.score+=50;
                    scoreUp();
                  }
                },
                textColor: Colors.grey[900],
                color: Colors.amber,
                child: Text('NO'),
              ),
              SizedBox(height: 50.0,),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserInputAQ()),
                  );
                },
                textColor: Colors.grey[900],
                color:Colors.amber,
                child: Text('ENTER YOUR OWN QUESTION'),
              ),
            ]
              )

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
            if(indexOfQuestion<10) {
              indexOfQuestion += 1;
            }
            else if(indexOfQuestion == 10){
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

             SizedBox(
               height: 100.0,
               width:  MediaQuery. of(context). size. width,
             child:
             CircularProgressIndicator(
               value: (globals.score/500),
               backgroundColor: Colors.grey[850],
               valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
               strokeWidth: 10,
             ),
             ),
             SizedBox(
               height: 20.0,
             ),
             Text(
               '${globals.score}',
               style: TextStyle(

                 fontSize: 30,
                 fontWeight: FontWeight.bold,
                 letterSpacing: 2.0,
                 fontFamily: 'BalsamiqSans',
                 color: Colors.amber,
               ),

             ),
             SizedBox(height: 30.0,),
             Text(
               'HIGHSCORE',
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
               '${globals.highScore}',
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
                 await preferences.setInt('scoreUp',0);
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










