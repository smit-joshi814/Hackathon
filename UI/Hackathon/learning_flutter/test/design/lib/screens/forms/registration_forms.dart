import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:design/controllers/registration_controller.dart';

class RegistrationForm extends StatefulWidget {
  final AnimationController animationController;
  final Animation<double> animation;
  const RegistrationForm({
    Key? key,
    required this.animationController,
    required this.animation,
  }) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: widget.animationController.value * 100,
            width: widget.animationController.value * 100,
          ),
          const SizedBox(height: 20),
          const Text(
            'Growth Guards',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: controller.name,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              controller: controller.password,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilledButton(
                  child: const Text('Sign Up'),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      RegistrationController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  },
                ),
                OutlinedButton(
                  child: const Text('LogIn'),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
