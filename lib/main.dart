import 'package:flutter/material.dart';

import './screens/chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DemoChatting',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: ChatScreen(),
    );
  }
}
