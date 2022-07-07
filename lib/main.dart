import 'package:day04_flashcards/flashcard.dart';
import 'package:day04_flashcards/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> _flashcards = [
    Flashcard(question: "The AppBar BackgroundColor?", answer: "Teal✅"),
    Flashcard(question: "Bat-signal is for?", answer: "Batman🦇!"),
    Flashcard(
        question: "Who writes the best code?",
        answer: "Ya boi Za Proqrammer!👨🏽‍💻")
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flashcard'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                 onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next'),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(
                        width: 2,
                        color: Colors.redAccent
                      )
                    ),
                    ),
              Text("Benjamin"),
              ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(8.0),
                    primary: Colors.white,
                    textStyle: const TextStyle(fontSize: 15),
                  ),
                  onPressed: () {},
                  child: const Text('< Gradient'),
                ),
              ],
            ),
          ),
          
              SizedBox(
                  width: 250,
                  height: 250,
                  child: FlipCard(
                      front: FlashcardView(
                        text: _flashcards[_currentIndex].question,
                      ),
                      back: FlashcardView(
                        text: _flashcards[_currentIndex].answer,
                      ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlineButton.icon(
                      onPressed: showPreviousCard,
                      icon: Icon(Icons.chevron_left),
                      label: Text('Prev')),
                  OutlineButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text('Next'),
                    color: Colors.teal,
                  ),
                  TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(8.0),
                    primary: Colors.teal,
                    textStyle: const TextStyle(fontSize: 15),
                    shape: StadiumBorder(),
                    side: BorderSide(
                      width: 2,
                      color: Colors.teal,
                    )
                  ),
                  onPressed: showNextCard,
                  child: const Text('> Gradient'),
                ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
