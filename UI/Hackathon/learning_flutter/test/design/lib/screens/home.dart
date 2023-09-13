import 'package:design/auth/firebase_auth_repository.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Growth Gards'),
        forceMaterialTransparency: true,
        leading: const Icon(Icons.home),
        actions: const [Icon(Icons.notifications), SizedBox(width: 20)],
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Welcome To Growth Guard',
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              child: const Text('LogOut'),
              onPressed: () {
                AuthenticationRepository.instance.logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
