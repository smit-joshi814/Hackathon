import 'package:flutter/material.dart';

import '../../utility/utils.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 50,
            width: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Hii, User Welcome To Growth Guards',
          ),
          const SizedBox(
            height: 20,
          ),
          for (int i = 1; i <= 10; i++)
            TextButton(
              onPressed: () {
                showSnackkBar(
                    message: 'Tapped $i', icon: const Icon(Icons.touch_app));
              },
              child: Card(
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/home_img_demo.jpg',
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4)),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.watch_later_outlined,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      "July 22-05:11",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.location_city,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      "Ahmedabad - Navrangpura",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 165,
                          ),
                          const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "Orange Spots On My Fields",
                              softWrap: true,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.android,
                                color: Colors.black87),
                            label: const Text(
                              'AI dignose: Bilister rust',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.person_search,
                                color: Colors.black87),
                            label: const Text(
                              'Expert dignose: Anthranose',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Image.asset('assets/images/home_img_demo.jpg'),
                  ],
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
