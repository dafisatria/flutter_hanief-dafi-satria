import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Center(
        child: Text('This is MaterialApp'),
      ),
      // ListView(
      //   children: const [
      //     ListTile(
      //       leading: ExcludeSemantics(
      //         child: CircleAvatar(
      //           backgroundColor: Colors.green,
      //           child: Text(
      //             'L',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //       title: Text('Leanne Graham'),
      //       subtitle: Text('1-770-736-8031 x56442'),
      //     ),
      //     ListTile(
      //       leading: ExcludeSemantics(
      //         child: CircleAvatar(
      //           backgroundColor: Colors.green,
      //           child: Text(
      //             'E',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //       title: Text('Ervin Howell'),
      //       subtitle: Text('010-692-6593 x09125'),
      //     ),
      //     ListTile(
      //       leading: ExcludeSemantics(
      //         child: CircleAvatar(
      //           backgroundColor: Colors.green,
      //           child: Text(
      //             'C',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //       title: Text('Clementine Bauch'),
      //       subtitle: Text('1-463-123-4447'),
      //     ),
      //     ListTile(
      //       leading: ExcludeSemantics(
      //         child: CircleAvatar(
      //           backgroundColor: Colors.green,
      //           child: Text(
      //             'P',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //       title: Text('Patricia Lebsack'),
      //       subtitle: Text('493-170-9623 x156'),
      //     ),
      //     ListTile(
      //       leading: ExcludeSemantics(
      //         child: CircleAvatar(
      //           backgroundColor: Colors.green,
      //           child: Text(
      //             'C',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //       title: Text('Chelsey Dietrich'),
      //       subtitle: Text('(254)954-1289'),
      //     ),
      //     ListTile(
      //       leading: ExcludeSemantics(
      //         child: CircleAvatar(
      //           backgroundColor: Colors.green,
      //           child: Text(
      //             'M',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //       title: Text('Mrs. Dennis Schulist'),
      //       subtitle: Text('1-477-935-8478 x6430'),
      //     ),
      //     ListTile(
      //       leading: ExcludeSemantics(
      //         child: CircleAvatar(
      //           backgroundColor: Colors.green,
      //           child: Text(
      //             'K',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //       title: Text('Kurtis Weissnat'),
      //       subtitle: Text('210.067.6132'),
      //     ),
      //   ],
      // ),
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
