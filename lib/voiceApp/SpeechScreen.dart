import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechScreenState extends StatefulWidget {
  @override
  __SpeechScreenStateState createState() => __SpeechScreenStateState();
}

class __SpeechScreenStateState extends State<SpeechScreenState> {
  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
    ),
    'Voice': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
    ),
    'HI': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    ),
    'My Name': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
    ),
  };

  stt.SpeechToText _speech;
  bool _isListen = false; 
  String text = 'Press the button and start speacking';
  double confidece = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confidence: ${(confidece * 100).toStringAsFixed(1)}%'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: true, //_isListen,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListen ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 150),
          child: TextHighlight(
            text: text,
            words: _highlights,
            textStyle: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListen) {
      bool available = await _speech.initialize(
        onStatus: (val) => print("OnStatus: $val"),
        onError: (val) => print("OnError: $val"),
      );
      if (available) {
        setState(() => _isListen = true);
        _speech.listen(
          onResult: (val) => setState(
            () {
              text = val.recognizedWords;
              if (val.hasConfidenceRating && val.confidence > 0) {
                confidece = val.confidence;
              }
            },
          ),
        );
      }
    } else {
      setState(() {
        _isListen = false;
        _speech.stop();
      });
    }
  }
}
