

import 'package:flutter/material.dart';
import 'package:open_app/App.dart';

import 'package:open_app/voiceApp/SpeechScreen.dart';

void main(List<String> args) {
  runApp(MyHomePage());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Voice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SpeechScreenState(),
    );
  }
}

