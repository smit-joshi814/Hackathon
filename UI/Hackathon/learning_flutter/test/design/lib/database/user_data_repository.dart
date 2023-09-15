import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserDataRepository extends GetxController {
  // static UserDataRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
}
