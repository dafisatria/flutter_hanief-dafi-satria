import 'package:flutter/material.dart';

class ExplorationPage extends StatelessWidget {
  const ExplorationPage({super.key});

  @override
  Widget build(BuildContext context) {
    const data = [
      'Learn Flutter',
      'Learn ReactJS',
      'Learn VueJS',
      'Learn Tailwind CSS',
      'Learn UI/UX',
      'Learn Figma',
      'Learn Digital Marketing',
    ];
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
        body: ListView.separated(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(data[index]),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 16,
            );
          },
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
