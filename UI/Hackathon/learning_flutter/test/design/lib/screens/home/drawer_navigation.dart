import 'package:flutter/material.dart';

import '../../auth/firebase_auth_repository.dart';

class HomeNavigationDrawer extends StatelessWidget {
  const HomeNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Image(
                  height: 100,
                  width: 100,
                  image: AssetImage('assets/images/logo.png')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Page 1',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              //
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_a_photo),
            title: const Text(
              'Page 2',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              //
            },
          ),
          OutlinedButton(
            child: const Text('LogOut'),
            onPressed: () {
              AuthenticationRepository.instance.logOut();
            },
          ),
        ],
      ),
    );
  }
}
