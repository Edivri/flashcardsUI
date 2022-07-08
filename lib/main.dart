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
        answer: "Ya boi Za Proqrammer!👨🏽‍💻"),
        Flashcard(question: "Another name for object function?", answer: "method"),
        Flashcard(question: "What are mixins?", answer: "Mixins are a language concept that allows a programmer to inject some code into a class"),
        Flashcard(question: "What is polymorphism?", answer: "Polymorphism is the ability of an object to take on many forms."),
        Flashcard(question: "What is encapsulation?", answer: "encapsulation refers to the bundling of data with the methods that operate on that data, or the restricting of direct access to some of an object's components.")
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
              Text("The Cards"),
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
                      Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(8.0 * 2),
                        primary: Colors.teal,
                        // backgroundColor: Colors.amber,
                        textStyle: const TextStyle(fontSize: 15),
                        shape: StadiumBorder(),
                        side: BorderSide(
                          width: 2,
                          color: Colors.teal,
                        )),
                    onPressed: showNextCard,
                    child: const Text('⬅️ Prev'),
                  ),
                  
                  // OutlineButton.icon(
                  //     onPressed: showPreviousCard,
                  //     icon: Icon(Icons.chevron_left),
                  //     label: Text('Prev')),
                  // OutlineButton.icon(
                  //   onPressed: showNextCard,
                  //   icon: Icon(Icons.chevron_right),
                  //   label: Text('Next'),
                  //   color: Colors.teal,
                  // ),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(16.0),
                        primary: Colors.teal,
                        // backgroundColor: Colors.amber,
                        textStyle: const TextStyle(fontSize: 15),
                        shape: StadiumBorder(),
                        side: BorderSide(
                          width: 2,
                          color: Colors.teal,
                        )),
                    onPressed: showNextCard,
                    child: const Text('Next ➡️'),
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
