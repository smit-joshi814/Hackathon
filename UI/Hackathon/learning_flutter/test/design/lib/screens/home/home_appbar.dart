import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_notification.dart';

class HomeAppBar {
  PreferredSizeWidget homeAppBar() {
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
            //
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            Get.to(const HomeNotification());
          },
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}
