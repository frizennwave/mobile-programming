import 'package:flutter/material.dart';

class WidgetBertingkatScreen extends StatelessWidget {
  const WidgetBertingkatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Bertingkat'),
        backgroundColor: Colors.lightBlue[800],
        leading: Icon(Icons.home),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/philosophy.jpg', width: 250, height: 250),
            const Text('philosophy', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
