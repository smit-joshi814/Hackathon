import 'package:design/auth/firebase_auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  static RegistrationController get instance => Get.find();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithNameEmailAndPassword(email, password);
  }
}
