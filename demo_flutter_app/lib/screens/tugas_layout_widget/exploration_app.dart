import 'package:flutter/material.dart';
import 'package:demo_flutter_app/models/data_layout_exploration.dart';

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
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.image),
                onPressed: () => Navigator.of(context).pushNamed('/Image'),
              ),
              label: 'Image',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: const Icon(Icons.contacts),
                onPressed: () => Navigator.of(context).pushNamed('/Contacts'),
              ),
              label: 'Contacts',
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
