import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {},
          ),
          const Divider(thickness: 1),
          ListTile(
            title: const Text('About Us'),
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {},
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
