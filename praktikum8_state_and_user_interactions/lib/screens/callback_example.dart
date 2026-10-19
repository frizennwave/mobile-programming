import 'package:flutter/material.dart';

class CallbackExample extends StatelessWidget {
  const CallbackExample({super.key});

  void _showMessage(String message) {
    debugPrint('Message received: $message');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        leading: const Icon(Icons.phone_callback),
        title: const Text('Callback Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _showMessage("Button Pressed");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}
