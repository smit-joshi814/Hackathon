import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:design/screens/desise_full_description/desise_description_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getImages(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // for (int i = 1; i <= 10; i++)
                    TextButton(
                      onPressed: () {
                        // showSnackkBar(
                        //     message: 'Tapped $index',
                        //     icon: const Icon(Icons.touch_app));
                        Get.to(DesiseDescriptionScreen(
                            snapsnot: snapshot.data!.docs[index]));
                      },
                      child: Card(
                        elevation: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 250,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    snapshot.data!.docs[index].data()["url"],
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.sizeOf(context).width,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.4)),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                              Icons.location_on_outlined,
                                              color: Colors.white,
                                            ),
                                            label: Text(
                                              snapshot.data!.docs[index]
                                                  .data()["geoLocation"],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 165,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      snapshot.data!.docs[index]
                                          .data()["imageText"],
                                      softWrap: true,
                                      style: const TextStyle(
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
                                    label: Text(
                                      'AI dignose: ${snapshot.data!.docs[index].data()["aiDignose"]}',
                                      style: const TextStyle(
                                          color: Colors.black87),
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.person_search,
                                        color: Colors.black87),
                                    label: Text(
                                      'Expert dignose: ${snapshot.data!.docs[index].data()["expertDignose"] != '' ? snapshot.data!.docs[index].data()["expertDignose"] : "No Expert Dignose Available"}',
                                      style: const TextStyle(
                                          color: Colors.black87),
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
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return const Text("No data");
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getImages() {
    return fb.collection("Images").get();
  }
}
