import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatelessWidget {
  
  var number = '+919737656057';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Open'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MaterialButton(
                shape: StadiumBorder(),
                onPressed: () {
                  FlutterOpenWhatsapp.sendSingleMessage(
                      number, 'How Are You Sent By FLutter');
                },
                child: Text(
                  'WhatsApp',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                color: Colors.green,
              ),
              Divider(),
              MaterialButton(
                shape: StadiumBorder(),
                height: 20,
                onPressed: () {
                  launch('https://www.facebook.com/login/');
                },
                child: Text('FaceBook', style: TextStyle(fontSize: 30)),
                color: Colors.blue,
              ),
              Divider(),
              MaterialButton(
                shape: StadiumBorder(),
                onPressed: () {
                  launch('MobileNO:$number');
                },
                child: Text('CALL', style: TextStyle(fontSize: 30)),
                color: Colors.purple,
              ),
              Divider(),
              MaterialButton(
                shape: StadiumBorder(),
                onPressed: () {
                  launch('Sms:$number');
                },
                child: Text('SMS', style: TextStyle(fontSize: 30)),
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
