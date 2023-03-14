import 'package:flutter/material.dart';

class ExplorationPage extends StatelessWidget {
  const ExplorationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Flutter App'),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.search),
            ),
          ],
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: ListView(
          children: const [
            ListTile(
              title: Text('Learn Flutter'),
            ),
            Divider(
              indent: 16,
            ),
            ListTile(
              title: Text('Learn ReactJS'),
            ),
            Divider(
              indent: 16,
            ),
            ListTile(
              title: Text('Learn VueJS'),
            ),
            Divider(
              indent: 16,
            ),
            ListTile(
              title: Text('Learn Tailwind CSS'),
            ),
            Divider(
              indent: 16,
            ),
            ListTile(
              title: Text('Learn UI/UX'),
            ),
            Divider(
              indent: 16,
            ),
            ListTile(
              title: Text('Learn Figma'),
            ),
            Divider(
              indent: 16,
            ),
            ListTile(
              title: Text('Learn Digital Marketing'),
            ),
            Divider(
              indent: 16,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.black,
            child: const Icon(Icons.add)),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Information',
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
