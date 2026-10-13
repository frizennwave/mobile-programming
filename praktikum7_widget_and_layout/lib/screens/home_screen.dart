import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        leading: Icon(Icons.home),
        title: Text('Flutter Widget Sederhana'),
      ),
      body: Center(
        child: Text('Ini halaman beranda', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
