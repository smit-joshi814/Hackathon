import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/auth/firebase_auth_repository.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUsers(),
        builder: (context,
            AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/logo.png'),
                ),
                const SizedBox(height: 10),
                Text(
                  snapshot.data!["Name"],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                  width: 200,
                  child: Divider(color: Colors.black12),
                ),
                // InfoCard(
                //     text: phone, icon: Icons.phone, onPressed: () async {}),
                // InfoCard(
                //     text: location,
                //     icon: Icons.location_city,
                //     onPressed: () async {}),
                InfoCard(
                    text: snapshot.data!['email'],
                    icon: Icons.email,
                    onPressed: () async {}),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return const Text("No data");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUsers() {
    return fb
        .collection("Users")
        .doc(AuthenticationRepository.instance.firebaseUser.value!.uid)
        .get();
  }
}

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPressed;

  const InfoCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: ListTile(
          leading: Icon(
            icon,
          ),
          title: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
