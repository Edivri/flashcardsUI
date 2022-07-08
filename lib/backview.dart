import 'package:flutter/material.dart';

class BackcardView extends StatelessWidget {
  final String text;

  BackcardView({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          textScaleFactor: 3,
        ),
      ),
    );
  }
}
