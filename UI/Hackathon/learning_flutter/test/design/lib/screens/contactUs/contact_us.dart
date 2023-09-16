import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Contact Us",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: 200,
                width: 200,
                image: AssetImage('assets/images/logo.png'),
              ),
              SizedBox(height: 30),
              buildContactInfo("Our toll-free number:", "000-000-0000"),
              SizedBox(height: 20),
              buildContactInfo("Website:", "growthguards@abc.com"),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildSocialIcon(Icons.phone, Colors.green, () {
                    launch("tel:+0000000000");
                  }),
                  SizedBox(width: 20),
                  buildSocialIcon(Icons.web, Colors.blue, () {
                    launch("https://example.com");
                  }),
                  SizedBox(width: 20),
                  buildSocialIcon(Icons.facebook, Colors.blue, () {
                    launch("https://www.facebook.com/yourpage");
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContactInfo(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildSocialIcon(IconData icon, Color iconColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: iconColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
