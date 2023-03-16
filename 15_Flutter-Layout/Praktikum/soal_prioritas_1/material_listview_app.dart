import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    const data = [
      {"username": "PurplePenguin22", "phone": "(555) 123-4567"},
      {"username": "GreenGiraffe99", "phone": "(555) 234-5678"},
      {"username": "SilverSunshine11", "phone": "(555) 345-6789"},
      {"username": "BlueButterfly44", "phone": "(555) 456-7890"},
      {"username": "GoldenDragonfly77", "phone": "(555) 567-8901"},
      {"username": "RedRainbow66", "phone": "(555) 678-9012"},
      {"username": "OrangeMeadow55", "phone": "(555) 789-0123"},
      {"username": "YellowNightfall33", "phone": "(555) 890-1234"},
      {"username": "BlackStarlight88", "phone": "(555) 901-2345"},
      {"username": "PinkMoonstone77", "phone": "(555) 012-3456"}
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                data[index]['username']![0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text('${data[index]['username']}'),
            subtitle: Text('${data[index]['phone']}'),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
