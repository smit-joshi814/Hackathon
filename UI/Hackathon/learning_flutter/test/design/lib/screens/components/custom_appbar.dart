import 'package:design/screens/components/search_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../notification_screen.dart';

class CustomAppBar {
  PreferredSizeWidget customAppBar() {
    return AppBar(
      title: const Text(
        'Growth Guards',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(context: Get.context!, delegate: SearchNavigation());
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            Get.to(const NotificationScreen());
          },
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}
