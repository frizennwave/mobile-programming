import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        leading: Icon(Icons.home),
        title: Text('Flutter Layout'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: const <Widget>[
                Icon(Icons.archive),
                Text(
                  'Artikel Terbaru',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.network(
                    'https://images.unsplash.com/photo-1555993539-1732b0258235?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
                  ),
                  const Text('Athens'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
