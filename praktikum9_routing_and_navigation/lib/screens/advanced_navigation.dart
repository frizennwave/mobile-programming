import 'package:flutter/material.dart';

class AdvancedNavigation extends StatelessWidget {
  const AdvancedNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigasi Lanjutan',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/pantai': (context) =>
            const MenuPage(menuTitle: 'Pantai', icon: Icons.beach_access),
        '/gunung': (context) =>
            const MenuPage(menuTitle: 'Gunung', icon: Icons.terrain),
        '/budaya': (context) =>
            const MenuPage(menuTitle: 'Budaya', icon: Icons.museum),
        '/kuliner': (context) =>
            const MenuPage(menuTitle: 'Kuliner', icon: Icons.restaurant),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: const EdgeInsets.all(20.0),
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/pantai');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            icon: const Icon(Icons.beach_access),
            label: const Text('Pantai'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/gunung');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            icon: const Icon(Icons.terrain),
            label: const Text('Gunung'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/budaya');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            icon: const Icon(Icons.museum),
            label: const Text('Budaya'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/kuliner');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[700],
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            icon: const Icon(Icons.restaurant),
            label: const Text('Kuliner'),
          ),
        ],
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final String menuTitle;
  final IconData icon;
  const MenuPage({super.key, required this.menuTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuTitle),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          icon: Icon(icon),
          label: const Text('Kembali'),
        ),
      ),
    );
  }
}
